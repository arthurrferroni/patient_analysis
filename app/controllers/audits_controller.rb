class AuditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_audit, only: %i[show edit update destroy]

  def index
    @audits = @patient.audits
  end

  def show
    # @audit já está definido
  end

  def new
    @audit = @patient.audits.build
  end

  def create
    @audit = @patient.audits.build(audit_params)
    if @audit.save
      redirect_to [@patient, @audit], notice: 'Auditoria criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @audit já está definido
  end

  def update
    if @audit.update(audit_params)
      redirect_to [@patient, @audit], notice: 'Auditoria atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @audit.destroy
    redirect_to patient_audits_path(@patient), notice: 'Auditoria excluída com sucesso.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_audit
    @audit = @patient.audits.find(params[:id])
  end

  def audit_params
    params.require(:audit).permit(
      :supervisor_id,
      :data_auditoria,
      :detalhes,
      :conclusao,
      :proxima_auditoria
    )
  end
end