class Hike < ApplicationRecord
	# Associations
	has_many :planned_hikes
	has_many :users, through: :planned_hikes
	belongs_to :leader, :class_name => "User", :foreign_key => 'leader_id'
	belongs_to :hiking_trail, optional: true
	# Validations
	validates :title, :description, :hike_date, :presence => true
	validates :description, :length => { :maximum => 390 }
	validates :notes, :length => { :maximum => 200 }
	validate :valid_hike_date
	# Scope Methods
	scope :by_date, -> { order(:hike_date) }
	scope :next_three_days, -> { Hike.where("hike_date < ?",Time.now + 3.days) }
	
	def hiking_trail_attributes=(hiking_trail_attributes)
		if !hiking_trail_attributes.empty?			
			h_t = HikingTrail.find_or_create_by(name: hiking_trail_attributes[:name])			
			if h_t
				h_t.update(hiking_trail_attributes)
				self.hiking_trail_id = h_t.id
			end
		end
	end

	def format_date
		self.hike_date = hike_date.strftime("%B %d, %Y")
	end

	def format_time
		self.hike_time = hike_time.strftime('%r')
	end

	private 

	def valid_hike_date		
		if !hike_date.nil? && hike_date < Time.now
			errors.add(:hike_date, "can't be in the past")
		end
	end

	

end
