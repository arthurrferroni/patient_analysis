# app/controllers/report_resumes_controller.rb

class ReportResumesController < ApplicationController
  before_action :set_patient
  before_action :set_report
  before_action :set_report_resume

  def show
    # A action show está vazia porque as variáveis de instância já estão definidas pelos before_actions
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to patients_path, alert: "Paciente não encontrado."
  end

  def set_report
    @report = @patient.reports.find(params[:report_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to patient_reports_path(@patient), alert: "Relatório não encontrado."
  end

  def set_report_resume
    @report_resume = @report.report_resume
    unless @report_resume
      redirect_to patient_report_path(@patient, @report), alert: "Resumo do relatório não encontrado."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to patient_report_path(@patient, @report), alert: "Resumo do relatório não encontrado."
  end
end
