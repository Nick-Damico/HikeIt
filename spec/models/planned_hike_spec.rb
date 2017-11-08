require 'rails_helper'

RSpec.describe PlannedHike, type: :model do

	before  do
		@user = User.create(trail_name: 'Dreadful Rebel', email: "d_rebel@hikesmokies.com", password: "happyhiker20")		
		@hike = Hike.create!(title: "Sunday Night Hike", description: "Our bi-weekly Sunday night hike will be to Chimmney Tops Trail.", hike_date: Time.new(2017,12,20), leader_id: @user.id)
		@planned_hike = PlannedHike.create!(user_id: @user.id, hike_id: @hike.id)
	end

	it 'belongs to a user' do
		expect(@planned_hike.user).to eq(@user)
	end

	it 'belongs to a hike' do
		expect(@planned_hike.hike).to eq(@hike)
	end

	it 'has a date through hike' do
		expect(@planned_hike.hike.hike_date).to eq("December 20, 2017")
	end
end