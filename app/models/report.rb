class Report < ApplicationRecord
  acts_as_tenant(:company)
  belongs_to :patient
  belongs_to :company

  has_one :report_resume, dependent: :destroy
  
  validates :content, presence: true
end
