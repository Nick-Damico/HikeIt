require 'Faker'
FactoryBot.define do
  factory :user do
  	# Faker::Omniauth.facebook
  	trail_name {Faker::Pokemon.name}
    email {Faker::Internet.email}
    password "happyhappy"
  end

end
