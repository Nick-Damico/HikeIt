class HikingTrail < ApplicationRecord
	validates :name, :location, :area, :distance, :presence => true
	validates :name, :uniqueness => true
	has_many :hikes
	belongs_to :feature

	TRAIL_AREAS = [
		"Gatlinburg / Mt. LeConte Area",
		"Newfound Gap / Clingmans Dome Area",
		"Cades Cove / Townsend Area",
		"Elkmont Area",
		"Cherokee / Deep Creek Area",
		"Greenbrier / Cosby Area",
		"Balsam Mountain / Big Creek / Cataloochee / Fontana Lake"
	]
end
