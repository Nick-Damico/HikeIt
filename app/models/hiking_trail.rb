class HikingTrail < ApplicationRecord
	validates :name, :location, :area, :distance, :presence => true
	validates :name, :uniqueness => true
end
