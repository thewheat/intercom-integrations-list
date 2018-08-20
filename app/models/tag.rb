class Tag < ApplicationRecord
  has_many :taggings
  has_many :integrations, through: :taggings
  validates :name, presence: true
end
