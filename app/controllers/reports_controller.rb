class ReportsController < ApplicationController
  def new
    @patient = Patient.find(params[:patient_id])
    @report = @patient.reports.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @report = @patient.reports.new(report_params)
    if @report.save
      GenerateReportResumeJob.perform_later(@report.id)
      redirect_to @patient, notice: 'Relatório criado. O resumo será gerado em breve.'
    else
      render :new
    end
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @report = @patient.reports.find(params[:id])
  end

  private

  def report_params
    params.require(:report).permit(:date, :content)
  end
end
