# app/controllers/patients_controller.rb

class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = current_company.patients
  end

  def show
    @reports = @patient.reports
  end

  def new
    @patient = current_company.patients.new
  end

  def create
    @patient = current_company.patients.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: 'Paciente criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Paciente atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: 'Paciente excluído com sucesso.'
  end

  private

  def set_patient
    @patient = current_company.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :other_attributes...)
  end

  def current_company
    ActsAsTenant.current_tenant
  end
end
