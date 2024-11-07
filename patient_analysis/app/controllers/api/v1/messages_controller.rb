class MessagesController < ApplicationController
  before_action :authenticate_request

  def show
    render json: { message: "Bem-vindo #{@current_user.email}! Esta é uma mensagem secreta." }
  end
end