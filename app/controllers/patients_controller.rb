class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @reports = @patient.reports
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: 'Paciente criado com sucesso.'
    else
      render :new
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name)
  end
end
