class User < ApplicationRecord
	has_many :planned_hikes
	has_many :hikes, through: :planned_hikes
	
	validates :bio, length: { maximum: 160 }
	validates :location, length: { maximum: 21 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def planned_hikes
  	Hike.all.where(leader_id: self.id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email, 
      user.profile_image = auth.info.image,
      user.password = Devise.friendly_token[0,20]
    end      
  end
  
end
