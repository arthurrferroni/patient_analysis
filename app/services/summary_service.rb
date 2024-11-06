
require 'faraday/retry'

class SummaryService
  def initialize(therapeutic_session)
    @therapeutic_session = therapeutic_session
    @api_key = ENV['GROQ_API_KEY']
    @api_url = 'https://api.groq.com/openai/v1/chat/completions'
    @connection = Faraday.new do |conn|
      conn.request :retry, max: 3, interval: 0.05, backoff_factor: 2
      conn.response :logger, Rails.logger
      conn.adapter Faraday.default_adapter
    end
  end

  def call
    response = @connection.post(@api_url) do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "Bearer #{@api_key}"
      req.body = request_body.to_json
    end

    if response.success?
      process_response(response)
    else
      handle_error(response)
    end
  rescue Faraday::Error => e
    Rails.logger.error("Erro de conexão: #{e.message}")
    # Opcional: reencaminhar o job ou notificar o administrador
  end

  private

  def request_body
    {
      model: 'llama-3.1-70b-versatile',
      messages: [
        { role: 'system', content: 'Você é um assistente que resume sessões terapêuticas para registros médicos.' },
        { role: 'user', content: session_content }
      ],
      temperature: 0.7
    }
  end

  def session_content
    <<~CONTENT
      Paciente: #{@therapeutic_session.therapeutic_plan.patient.nome}
      Data da Sessão: #{@therapeutic_session.data_sessao}
      Profissional: #{@therapeutic_session.professional.nome}
      Descrição da Sessão:
      #{@therapeutic_session.descricao}

      Observações:
      #{@therapeutic_session.observacoes}
    CONTENT
  end

  def process_response(response)
    data = JSON.parse(response.body)
    summary = data.dig('choices', 0, 'message', 'content')
    tokens_used = data.dig('usage', 'total_tokens')
    total_time = response.headers['X-Processing-Time'].to_f / 1000

    # Salvar o resumo associado à sessão terapêutica
    @therapeutic_session.create_summary(
      content: summary.strip,
      tokens_used: tokens_used,
      total_time: total_time
    )
  end

  def handle_error(response)
    error_message = "Erro na API do GROQ: #{response.status} - #{response.body}"
    Rails.logger.error(error_message)
    # Opcional: reencaminhar o job ou notificar o administrador
  end
end
