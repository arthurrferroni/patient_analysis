class Evaluation < ApplicationRecord
  belongs_to :patient

  validates :data_avaliacao, :tipo_avaliacao, :resultado_avaliacao, presence: true
end