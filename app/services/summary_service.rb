require 'faraday/retry'

class SummaryService
  def initialize(report)
    @report = report
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
      req.body = {
        model: 'llama-3.1-70b-versatile',
        messages: [
          { role: 'system', content: 'Resuma o seguinte relatório médico:' },
          { role: 'user', content: @report.content }
        ],
        temperature: 0.7
      }.to_json
    end

    if response.success?
      process_response(response)
    else
      handle_error(response)
    end
  rescue Faraday::Error => e
    Rails.logger.error("Erro de conexão: #{e.message}")
    # Implementar lógica de reconexão ou notificação
  end

  private

  def process_response(response)
    data = JSON.parse(response.body)
    summary = data.dig('choices', 0, 'message', 'content')
    tokens_used = data.dig('usage', 'total_tokens')
    total_time = response.headers['X-Processing-Time'].to_f / 1000

    @report.create_report_resume(
      content: summary,
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
