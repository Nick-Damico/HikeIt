class PlannedHike < ApplicationRecord
	belongs_to :user
	belongs_to :hike
	enum hike_type: [:day_hike, :over_night]

end
