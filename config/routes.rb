require 'sidekiq/web'
Rails.application.routes.draw do
  resources :patients do
    resources :reports, only: [:new, :create, :show] do
      resource :report_resume, only: [:show]
    end
  end
  root 'patients#index'
  mount Sidekiq::Web => '/sidekiq'
end
