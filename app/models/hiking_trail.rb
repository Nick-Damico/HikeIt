class HikingTrail < ApplicationRecord

	has_many :hikes
	belongs_to :feature

	validates :name, :location, :area, :distance, :presence => true
	validates :name, :uniqueness => true
	before_validation :rating_to_integer
	
	scope :by_distance, -> { order(:distance) }
	scope :by_alphabet, -> { order(:name) }
	scope :by_area, -> (trail_area) { where('area = ?', trail_area) }
	
	TRAIL_AREAS = [
		"Gatlinburg / Mt. LeConte Area",
		"Newfound Gap / Clingmans Dome Area",
		"Cades Cove / Townsend Area",
		"Elkmont Area",
		"Cherokee / Deep Creek Area",
		"Greenbrier / Cosby Area",
		"Balsam Mountain / Big Creek / Cataloochee / Fontana Lake"
	]

	def rating_to_integer
		if self.difficulty_rating.class == Float
			self.difficulty_rating = difficulty_rating.to_i
		end
	end

	def feature_attributes=(feature_attributes)
		if !feature_attributes.empty?
			feature = Feature.find_or_create_by(title: feature_attributes[:title])
			if feature
				feature.update(feature_attributes)
				self.feature_id = feature.id
			end
		end		
	end

end
