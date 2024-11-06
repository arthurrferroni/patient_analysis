class TherapeuticPlan < ApplicationRecord
  belongs_to :patient

  has_many :therapeutic_sessions

  validates :data_inicio, :objetivos, :status, presence: true
end