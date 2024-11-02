require 'sidekiq/web'

Rails.application.routes.draw do
  # Rotas do Devise para autenticação de usuários
  devise_for :users

  # Rotas para Empresas (se for necessário gerenciar empresas via UI)
  resources :companies, only: [:index, :show]

  # Rotas para Pacientes
  resources :patients do
    # Rotas para Relatórios dentro de um Paciente
    resources :reports, only: [:new, :create, :show] do
      # Rotas para ReportResume dentro de um Relatório
      resource :report_resume, only: [:show]
    end
  end

  # Dashboard do Sidekiq, restrito a usuários administradores
  mount Sidekiq::Web => '/sidekiq'
  
  # Página inicial da aplicação
  root 'patients#index'
end
