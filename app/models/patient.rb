class Patient < ApplicationRecord
  belongs_to :school, optional: true
  belongs_to :company, optional: true # Plano de saúde

  has_many :evaluations, dependent: :destroy
  has_many :therapeutic_plans, dependent: :destroy
  has_many :audits, dependent: :destroy
  has_many :family_meetings, dependent: :destroy
  has_many :school_feedbacks, dependent: :destroy

  has_many :patient_clinics
  has_many :clinics, through: :patient_clinics

  validates :nome, :data_nascimento, :responsavel_principal, presence: true
end
