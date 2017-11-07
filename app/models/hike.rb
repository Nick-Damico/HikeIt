class Hike < ApplicationRecord
	validates :title, :description, :presence => true
	validates :description, :length => { :maximum => 390 }
	validates :notes, :length => { :maximum => 200 }
	validate :valid_hike_date
	# Will need future validations and test to check for belong_to :user(leader),
		# Also test for belong_to relationship with hiking_trail

	private 

	def valid_hike_date		
		if hike_date < Time.now
			errors.add(:hike_date, "date can't be in the past")
		end
	end
end
