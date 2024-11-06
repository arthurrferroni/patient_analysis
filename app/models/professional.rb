class Professional < ApplicationRecord
  belongs_to :clinic

  has_many :therapeutic_sessions

  validates :nome, :funcao, presence: true
end