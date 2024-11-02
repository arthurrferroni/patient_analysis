# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  before_action :set_tenant
  before_action :authenticate_user!

  # Adiciona configuração de parâmetros permitidos para Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permite que `company_id` seja aceito durante a inscrição
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_id])
    # Permite que `company_id` seja aceito durante a atualização de conta
    devise_parameter_sanitizer.permit(:account_update, keys: [:company_id])
  end

  private

  def set_tenant
    set_current_tenant(current_user.company) if user_signed_in?
  end
end
