class Api::V1::AutismiaController < ApplicationController
  before_action :authenticate_request

  def index
    @autismias = Autismia.all
    render json: @autismias
  end

  def show
    @autismia = Autismia.find(params[:id])
    render json: @autismia
  end

  def create
    @autismia = Autismia.new(autismia_params)
    if @autismia.save
      render json: @autismia, status: :created
    else
      render json: @autismia.errors, status: :unprocessable_entity
    end
  end

  def update
    @autismia = Autismia.find(params[:id])
    if @autismia.update(autismia_params)
      render json: @autismia
    else
      render json: @autismia.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @autismia = Autismia.find(params[:id])
    @autismia.destroy
    head :no_content
  end

  private

  # Define o método autismia_params para filtrar os parâmetros permitidos
  def autismia_params
    params.require(:autismia).permit(:nome, :endereco, :telefone, :email, :responsavel)
  end
end
