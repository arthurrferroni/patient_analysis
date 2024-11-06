class TherapeuticSession < ApplicationRecord
  belongs_to :therapeutic_plan
  belongs_to :professional
  belongs_to :clinic

  has_one :summary, dependent: :destroy
  
  validates :data_sessao, presence: true
end