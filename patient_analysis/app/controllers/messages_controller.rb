class MessagesController < ApplicationController
  before_action :authenticate_request

  def show
    render json: { 
      message: "Bem-vindo #{@current_user.email}! Esta é uma mensagem secreta.",
      timestamp: Time.current,
      user_id: @current_user.id
    }
  end

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end