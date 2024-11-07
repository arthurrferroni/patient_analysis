require 'swagger_helper'

RSpec.describe 'API V1', type: :request do
  path '/auth/login' do
    post 'Realiza o login do usuário' do
      tags 'Autenticação'
      consumes 'application/json'
      parameter name: :credentials, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
        },
        required: ['email', 'password']
      }
      
      let(:credentials) { { email: 'teste@exemplo.com', password: 'senha123'} }

      response '200', 'login realizado com sucesso' do
        schema type: :object,
               properties: {
                 token: { type: :string },
                 user: { 
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     email: { type: :string },
                     nome: { type: :string },
                   }
                 }
               }
        run_test!
      end

      response '401', 'credenciais inválidas' do
        let(:credentials) { { email: 'invalido@exemplo.com', password: 'senhaErrada', tipo: 'supervisor' } }
        
        schema type: :object,
               properties: {
                 error: { type: :string }
               }
        run_test!
      end
    end
  end

  let!(:user) { User.create!(email: 'teste@exemplo.com', password: 'senha123') }
  let!(:autismia) { Autismia.create!(nome: 'AutismIA', endereco: 'Rua Exemplo, 123', telefone: '(11) 1234-5678', email: 'contato@autismia.com', responsavel: 'Dr. Silva') }
  
  before(:each) do
    # Realize o login e obtenha o token para cada teste
    post '/auth/login', params: { email: 'teste@exemplo.com', password: 'senha123', tipo: 'supervisor' }.to_json,
                        headers: { 'Content-Type' => 'application/json' }
    @token = JSON.parse(response.body)['token']
  end

  let(:Authorization) { "Bearer #{@token}" }

  path '/api/v1/autismia' do
    get 'Lista todas as AutismIA' do
      tags 'AutismIA'
      produces 'application/json'
      security [bearerAuth: []]

      response '200', 'AutismIA listadas' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            nome: { type: :string },
            endereco: { type: :string },
            telefone: { type: :string },
            email: { type: :string },
            responsavel: { type: :string }
          }
        }
        let(:Authorization) { "Bearer #{@token}" } # Inclui o token de autenticação no cabeçalho
        run_test!
      end
    end
  end
end
