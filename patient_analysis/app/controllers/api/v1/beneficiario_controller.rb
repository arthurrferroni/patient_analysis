class Api::V1::BeneficiarioController < ApplicationController
  before_action :authenticate_request
  def index
    @beneficiarios = Beneficiario.all
    render json: @beneficiarios
  end

  def show
    @beneficiario = Beneficiario.find(params[:id])
    render json: @beneficiario
  end

  def create
    @beneficiario = Beneficiario.new(beneficiario_params)
    if @beneficiario.save
      render json: @beneficiario, status: :created
    else
      render json: @beneficiario.errors, status: :unprocessable_entity
    end
  end

  def update
    @beneficiario = Beneficiario.find(params[:id])
    if @beneficiario.status == "Ativo"
      if @beneficiario.update(beneficiario_params)
        render json: @beneficiario
      else
        render json: @beneficiario.errors, status: :unprocessable_entity
      end
    else
      render json: { message: "Beneficiário não está ativo" }, status: :unprocessable_entity
    end
  end

  def destroy
    @beneficiario = Beneficiario.find(params[:id])
    @beneficiario.destroy
  end
end

private

def beneficiario_params
  params.require(:beneficiario).permit(:nome, :data_nascimento, :diagnostico, :responsavel_principal, 
  :contato_responsavel, :data_entrada, :data_saida, :status, :escola_id, :plano_saude_id)
end

def beneficiario_is_ativo
  if @beneficiario.status != "Ativo"
    render json: { message: "Beneficiário não está ativo" }, status: :unprocessable_entity
  end
end