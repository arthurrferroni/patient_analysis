class Summary < ApplicationRecord
  belongs_to :therapeutic_session

  validates :content, presence: true
end
