class User < ApplicationRecord
	has_many :planned_hikes
	has_many :hikes, through: :planned_hikes
	
	validates :bio, length: { maximum: 160 }
	validates :location, length: { maximum: 21 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  def planned_hikes
  	Hike.all.where(leader_id: self.id)
  end
  
end
