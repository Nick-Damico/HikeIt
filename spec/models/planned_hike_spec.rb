require 'rails_helper'

RSpec.describe PlannedHike, type: :model do

	before  do
		@feature = Feature.create!(title: "Caves")
		@hiking_trail = HikingTrail.create!(name: 'Alum Cave Trail', location: "GSMNP", area: "Gatlinburg", distance: 5.5, feature_id: @feature.id)
		@user = User.create(trail_name: 'Dreadful Rebel', email: "d_rebel@hikesmokies.com", password: "happyhiker20")		
		@hike = Hike.create!(title: "Sunday Night Hike", description: "Our bi-weekly Sunday night hike will be to Chimmney Tops Trail.",hiking_trail_id: @hiking_trail.id, hike_date: Time.new(2017,12,20), leader_id: @user.id)
		@planned_hike = PlannedHike.create!(user_id: @user.id, hike_id: @hike.id, hike_type: 0)
	end

	it 'belongs to a user' do
		expect(@planned_hike.user).to eq(@user)
	end

	it 'belongs to a hike' do
		expect(@planned_hike.hike).to eq(@hike)
	end
end