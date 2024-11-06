class TherapeuticSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_therapeutic_plan
  before_action :set_therapeutic_session, only: %i[show edit update destroy]

  def index
    @therapeutic_sessions = @therapeutic_plan.therapeutic_sessions
  end

  def show
    # @therapeutic_session já está definido
  end

  def new
    @therapeutic_session = @therapeutic_plan.therapeutic_sessions.build
  end

  def create
    @therapeutic_session = @therapeutic_plan.therapeutic_sessions.build(therapeutic_session_params)
    if @therapeutic_session.save
      # Chamar o job para gerar o resumo
      GenerateReportResumeJob.perform_later(@therapeutic_session.id)
      redirect_to [@patient, @therapeutic_plan, @therapeutic_session], notice: 'Sessão terapêutica criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @therapeutic_session já está definido
  end

  def update
    if @therapeutic_session.update(therapeutic_session_params)
      redirect_to [@patient, @therapeutic_plan, @therapeutic_session], notice: 'Sessão terapêutica atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @therapeutic_session.destroy
    redirect_to patient_therapeutic_plan_therapeutic_sessions_path(@patient, @therapeutic_plan), notice: 'Sessão terapêutica excluída com sucesso.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_therapeutic_plan
    @therapeutic_plan = @patient.therapeutic_plans.find(params[:therapeutic_plan_id])
  end

  def set_therapeutic_session
    @therapeutic_session = @therapeutic_plan.therapeutic_sessions.find(params[:id])
  end

  def therapeutic_session_params
    params.require(:therapeutic_session).permit(
      :professional_id,
      :clinic_id,
      :data_sessao,
      :descricao,
      :observacoes
    )
  end
end
