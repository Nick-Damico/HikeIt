class HikingTrail < ApplicationRecord
	validates :name, :location, :area, :distance, :presence => true
	validates :name, :uniqueness => true
	has_many :hikes
	belongs_to :feature
end
