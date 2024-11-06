# app/jobs/generate_report_resume_job.rb

class GenerateReportResumeJob < ApplicationJob
  queue_as :default

  def perform(therapeutic_session_id)
    therapeutic_session = TherapeuticSession.find(therapeutic_session_id)
    SummaryService.new(therapeutic_session).call
  end
end
