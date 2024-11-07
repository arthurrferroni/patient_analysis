class Beneficiario < ApplicationRecord
  belongs_to :escola, optional: true
  belongs_to :plano_saude, optional: true
  has_many :beneficiarios_clinicas
  has_many :avaliacoes
  has_many :planos_terapeuticos
  has_many :auditorias
  has_many :reunioes_familiares
  has_many :feedbacks_escola
  validates :nome, :data_nascimento, :diagnostico, presence: true
end