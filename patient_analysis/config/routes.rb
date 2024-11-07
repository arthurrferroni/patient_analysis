require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  # Carrega as credenciais das variáveis de ambiente
  username == ENV.fetch("SIDEKIQ_ADMIN_USER") && password == ENV.fetch("SIDEKIQ_ADMIN_PASSWORD")
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' # Painel administrativo do Sidekiq protegido com autenticação
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :feedback_escola, only: [:index, :show, :create, :update, :destroy]
      resources :reuniao_familiar, only: [:index, :show, :create, :update, :destroy]
      resources :auditoria, only: [:index, :show, :create, :update, :destroy]
      resources :sessao_terapeutica, only: [:index, :show, :create, :update, :destroy]
      resources :profissional, only: [:index, :show, :create, :update, :destroy]
      resources :plano_terapeutico, only: [:index, :show, :create, :update, :destroy]
      resources :avaliacao, only: [:index, :show, :create, :update, :destroy]
      resources :beneficiario, only: [:index, :show, :create, :update, :destroy]
      resources :clinica, only: [:index, :show, :create, :update, :destroy]
      resources :escola, only: [:index, :show, :create, :update, :destroy]
      resources :plano_saude, only: [:index, :show, :create, :update, :destroy]
      resources :supervisor, only: [:index, :show, :create, :update, :destroy]
      resources :autismia, only: [:index, :show, :create, :update, :destroy]
    end
  end

  post '/auth/login', to: 'authentication#login'
  get '/message', to: 'messages#show'
  
  # Adicionar rota de teste para verificar se a API está funcionando
  get '/health', to: 'application#health'
end
