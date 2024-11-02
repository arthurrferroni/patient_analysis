# app/controllers/reports_controller.rb

class ReportsController < ApplicationController
  before_action :set_patient
  before_action :set_report, only: [:show]

  def new
    @report = @patient.reports.new
  end

  def create
    @report = @patient.reports.new(report_params)
    if @report.save
      GenerateReportResumeJob.perform_later(@report.id)
      redirect_to @patient, notice: 'Relatório criado. O resumo será gerado em breve.'
    else
      render :new
    end
  end

  def show
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_report
    @report = @patient.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:content, :other_attributes...)
  end
end
