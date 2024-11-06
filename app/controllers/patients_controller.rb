# app/controllers/patients_controller.rb

class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: %i[show edit update destroy]

  def index
    @patients = Patient.all
    @patients = policy_scope(Patient)
    authorize @patients
  end

  def show
    # @patient já está definido pelo before_action
    authorize @patient
  end

  def new
    @patient = Patient.new
    authorize @patient
  end

  def create
    @patient = Patient.new(patient_params)
    authorize @patient
    if @patient.save
      redirect_to @patient, notice: 'Paciente criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    authorize @patient
    # @patient já está definido pelo before_action
  end

  def update
    authorize @patient
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Paciente atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    authorize @patient
    @patient.destroy
    redirect_to patients_path, notice: 'Paciente excluído com sucesso.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
      :nome,
      :data_nascimento,
      :diagnostico,
      :responsavel_principal,
      :contato_responsavel,
      :data_entrada,
      :status,
      :school_id,
      :company_id
    )
  end
end
