class User < ApplicationRecord
	validates :trail_name, :uniqueness => true
	validates :bio, length: { maximum: 160 }
	validates :location, length: { maximum: 21 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
