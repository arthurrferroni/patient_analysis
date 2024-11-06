class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_evaluation, only: %i[show edit update destroy]

  def index
    @evaluations = @patient.evaluations
  end

  def show
    # @evaluation já está definido
  end

  def new
    @evaluation = @patient.evaluations.build
  end

  def create
    @evaluation = @patient.evaluations.build(evaluation_params)
    if @evaluation.save
      redirect_to [@patient, @evaluation], notice: 'Avaliação criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @evaluation já está definido
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to [@patient, @evaluation], notice: 'Avaliação atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @evaluation.destroy
    redirect_to patient_evaluations_path(@patient), notice: 'Avaliação excluída com sucesso.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_evaluation
    @evaluation = @patient.evaluations.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(
      :data_avaliacao,
      :tipo_avaliacao,
      :resultado_avaliacao,
      :detalhes
    )
  end
end