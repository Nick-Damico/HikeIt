class User < ApplicationRecord
	has_many :planned_hikes
	has_many :hikes, through: :planned_hikes

	validates :bio, length: { maximum: 160 }
	validates :location, length: { maximum: 21 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def planned_hikes
  	Hike.all.where(leader_id: self.id)
  end

  def self.set_email(auth)
    if auth.info.email
        auth.info.email
    else
        auth.info.name.split(" ").join("_").downcase + "@hikeit.net"
    end
  end

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.profile_image = auth.info.image,
      user.password = Devise.friendly_token[0,20]
    end
    user.email = set_email(auth)
    user.save
    user
  end

end
