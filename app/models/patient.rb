class Patient < ApplicationRecord
  acts_as_tenant(:company)
  belongs_to :company
  has_many :reports, dependent: :destroy

  validates :name, presence: true
end
