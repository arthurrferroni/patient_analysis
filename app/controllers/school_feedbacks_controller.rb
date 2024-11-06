class SchoolFeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_school_feedback, only: %i[show edit update destroy]

  def index
    @school_feedbacks = @patient.school_feedbacks
  end

  def show
    # @school_feedback já está definido
  end

  def new
    @school_feedback = @patient.school_feedbacks.build
  end

  def create
    @school_feedback = @patient.school_feedbacks.build(school_feedback_params)
    if @school_feedback.save
      redirect_to [@patient, @school_feedback], notice: 'Feedback escolar criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @school_feedback já está definido
  end

  def update
    if @school_feedback.update(school_feedback_params)
      redirect_to [@patient, @school_feedback], notice: 'Feedback escolar atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @school_feedback.destroy
    redirect_to patient_school_feedbacks_path(@patient), notice: 'Feedback escolar excluído com sucesso.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_school_feedback
    @school_feedback = @patient.school_feedbacks.find(params[:id])
  end

  def school_feedback_params
    params.require(:school_feedback).permit(
      :data_feedback,
      :observacoes,
      :supervisor_id,
      :status_acompanhamento
    )
  end
end