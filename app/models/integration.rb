class Integration < ApplicationRecord
	validates :name, :links, presence: true
	has_many :taggings
	has_many :tags, through: :taggings

end
