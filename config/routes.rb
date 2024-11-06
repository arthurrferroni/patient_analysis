# config/routes.rb
require 'sidekiq/web'

Rails.application.routes.draw do
  root 'patients#index'

  devise_for :users

  resources :patients do
    resources :evaluations
    resources :therapeutic_plans do
      resources :therapeutic_sessions
    end
    resources :audits
    resources :family_meetings
    resources :school_feedbacks
  end

  resources :companies
  resources :clinics do
    resources :professionals
  end
  resources :schools
  resources :supervisors

  mount Sidekiq::Web => '/sidekiq'
  
end
