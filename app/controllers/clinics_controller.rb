class ClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic, only: %i[show edit update destroy]

  def index
    @clinics = Clinic.all
  end

  def show
    # @clinic já está definido
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      redirect_to @clinic, notice: 'Clínica criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @clinic já está definido
  end

  def update
    if @clinic.update(clinic_params)
      redirect_to @clinic, notice: 'Clínica atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @clinic.destroy
    redirect_to clinics_path, notice: 'Clínica excluída com sucesso.'
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(
      :nome_clinica,
      :endereco,
      :telefone,
      :email,
      :responsavel_clinica
    )
  end
end