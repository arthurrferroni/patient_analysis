class ProfessionalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic
  before_action :set_professional, only: %i[show edit update destroy]

  def index
    @professionals = @clinic.professionals
  end

  def show
    # @professional já está definido
  end

  def new
    @professional = @clinic.professionals.build
  end

  def create
    @professional = @clinic.professionals.build(professional_params)
    if @professional.save
      redirect_to [@clinic, @professional], notice: 'Profissional criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @professional já está definido
  end

  def update
    if @professional.update(professional_params)
      redirect_to [@clinic, @professional], notice: 'Profissional atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @professional.destroy
    redirect_to clinic_professionals_path(@clinic), notice: 'Profissional excluído com sucesso.'
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end

  def set_professional
    @professional = @clinic.professionals.find(params[:id])
  end

  def professional_params
    params.require(:professional).permit(
      :nome,
      :funcao,
      :especialidade,
      :contato,
      :disponibilidade
    )
  end
end