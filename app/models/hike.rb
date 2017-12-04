class Hike < ApplicationRecord
	
	has_many :planned_hikes, dependent: :delete_all
	has_many :users, through: :planned_hikes
	belongs_to :leader, :class_name => "User", :foreign_key => 'leader_id'
	belongs_to :hiking_trail
	
	validates :title, :description, :hike_date, :presence => true
	validates :description, :length => { :maximum => 390 }
	validates :notes, :length => { :maximum => 200 }
	validate :valid_hike_date
	
	scope :by_date, -> { order(:hike_date) }
	scope :next_three_days, -> { Hike.where("hike_date < ?",Time.now + 3.days) }
	scope :day_hikes, -> { Hike.joins(:planned_hikes).where( planned_hikes: { hike_type: 'day_hike'})  }
	scope :overnight_hikes, -> { Hike.joins(:planned_hikes).where( planned_hikes: { hike_type: 'over_night'})  }
	
	def hiking_trail_attributes=(hiking_trail_attributes)
		if hiking_trail_attributes.values.any? { |v| !v.empty? }			
			h_t = HikingTrail.find_or_create_by(name: hiking_trail_attributes[:name])			
			if h_t
				h_t.update(hiking_trail_attributes)
				self.hiking_trail_id = h_t.id
			end
		end
	end

	def find_or_add_leader(user)
		self.leader_id = user.id if self.leader_id.nil?
	end
	
	def join_or_leave_hike(user)
		if self.users.include?(user)
			self.users.delete(user)
			"You've left planned hike #{self.title}."
		else
			self.users.push user
			"You've joined #{self.title}."
		end
	end

	def planned_hikes_attributes=(attributes)
		attributes.each do |i, attr|
			planned_hike = self.planned_hikes.last
			planned_hike.hike_type = attr[:hike_type].to_i
			planned_hike.save
		end
	end

	private 

	def valid_hike_date		
		if !hike_date.nil? && hike_date < Time.now
			errors.add(:hike_date, "can't be in the past")
		end
	end

	def self.get_day_hikes
		day_hikes.uniq
	end

	def self.get_overnight_hikes
		overnight_hikes.uniq
	end

end
