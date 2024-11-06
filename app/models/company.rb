class Company < ApplicationRecord
  has_many :patients

  validates :nome_plano, presence: true
end
