Rails.application.routes.draw do
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
