# app/controllers/companies_controller.rb

class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = Company.all
  end

  def show
    # @company já está definido
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: 'Empresa criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @company já está definido
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Empresa atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path, notice: 'Empresa excluída com sucesso.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :nome_plano,
      :endereco,
      :telefone,
      :email,
      :responsavel_plano
    )
  end
end
