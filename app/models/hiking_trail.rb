class HikingTrail < ApplicationRecord
	has_many :hikes
	belongs_to :feature

	validates :name, :location, :area, :distance, :presence => true
	validates :name, :uniqueness => true
	before_validation :rating_to_integer

	scope :by_area, -> (trail_area) { where('area = ?', trail_area) }

	scope :difficulty_easy, -> { where('difficulty_rating < ?',5) }
	scope :difficulty_moderate, -> { where('difficulty_rating > ? AND difficulty_rating < ?', 4,11) }
	scope :difficulty_strenous, -> { where('difficulty_rating > ?', 10) }

	scope :distance_short, -> { where('distance < ?',5) }
	scope :distance_medium, -> { where('distance > ? AND distance < ?',4,10) }
	scope :distance_long, -> { where('distance > ? AND distance <= ?',9, 15) }
	scope :distance_extreme, -> { where('distance > ?',15) }

	TRAIL_AREAS = [
		"Gatlinburg / Mt. LeConte Area",
		"Newfound Gap / Clingmans Dome Area",
		"Cades Cove / Townsend Area",
		"Elkmont Area",
		"Cherokee / Deep Creek Area",
		"Greenbrier / Cosby Area",
		"Balsam Mountain / Big Creek / Cataloochee / Fontana Lake"
	]

	TRAIL_LENGTH = ['easy', 'short', 'medium', 'long', 'extreme']

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

	def self.check_difficulty(attribute)
		attribute == 'easy' || attribute == 'moderate' || attribute == 'strenous'
	end

	def self.get_trails_by_difficulty(rating)
		self.send("difficulty_#{rating}").order(:difficulty_rating)
	end

	def self.get_trails_by_distance(length)
		self.send("distance_#{length}").order(:distance)
	end

	def self.getTrails(params)
		if !params[:attribute].blank?
			attribute_value = params[:attribute]
			if TRAIL_AREAS.include?(attribute_value)
		    	self.by_area(attribute_value).order(:name)

		    elsif check_difficulty(attribute_value)
		    	self.get_trails_by_difficulty(attribute_value)

		    elsif TRAIL_LENGTH.include?(attribute_value)
		    	self.get_trails_by_distance(attribute_value)

		    else
		      	self.all
		    end
		else
			self.all
		end
	end

end
