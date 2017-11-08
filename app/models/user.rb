class User < ApplicationRecord
	has_many :planned_hikes
	has_many :hikes, through: :planned_hikes
	
	validates :trail_name, :uniqueness => true
	validates :bio, length: { maximum: 160 }
	validates :location, length: { maximum: 21 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
