class FeedbackEscola < ApplicationRecord
  belongs_to :beneficiario
  belongs_to :supervisor
  validates :data_feedback, :observacoes, presence: true
end