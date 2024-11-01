class GenerateReportResumeJob < ApplicationJob
  queue_as :default

  def perform(report_id)
    report = Report.find(report_id)
    SummaryService.new(report).call
  end
end
