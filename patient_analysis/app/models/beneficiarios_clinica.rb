class BeneficiariosClinica < ApplicationRecord
  belongs_to :beneficiario
  belongs_to :clinica
  validates :data_inicio, presence: true
end