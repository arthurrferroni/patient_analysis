class ReportResumesController < ApplicationController
  def show
    @patient = Patient.find(params[:patient_id])
    @report = @patient.reports.find(params[:report_id])
    @report_resume = @report.report_resume
  end
end
