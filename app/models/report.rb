class Report < ApplicationRecord
  belongs_to :patient
  has_one :report_resume, dependent: :destroy
end
