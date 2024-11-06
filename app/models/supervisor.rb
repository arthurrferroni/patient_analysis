class Supervisor < ApplicationRecord
  belongs_to :autismia

  has_many :audits
  has_many :family_meetings
  has_many :school_feedbacks

  validates :nome, presence: true
end