class Integration < ApplicationRecord
	validates :name, presence: true
	has_many :taggings
	has_many :tags, through: :taggings

end
