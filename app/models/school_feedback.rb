class SchoolFeedback < ApplicationRecord
  belongs_to :patient
  belongs_to :supervisor

  validates :data_feedback, :observacoes, presence: true
end