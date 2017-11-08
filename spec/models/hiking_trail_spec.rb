require 'rails_helper'

RSpec.describe HikingTrail, type: :model do
  it 'is valid with a name, location, area, distance' do
  	expect(build(:hiking_trail)).to be_valid
  end

  it 'is invalid without a name' do
  	expect(build(:hiking_trail, name: nil)).to_not be_valid
  end

  it 'is invalid without a location' do
  	expect(build(:hiking_trail, location: nil)).to_not be_valid
  end

  it 'is invalid without a area' do 
  	expect(build(:hiking_trail, area: nil)).to_not be_valid
  end

  it 'is invalid without a distance' do
  	expect(build(:hiking_trail, distance: nil)).to_not be_valid
  end

  it 'is valid with a unique name' do
  	expect(build(:hiking_trail)).to be_valid
  end

  it 'is invalid with a none unique name' do
  	trail = build(:hiking_trail)
  	trail.save
  	new_trail = HikingTrail.new(
  		name: "Alum Cave Trail",
  		location: "441 North",
  		area: "Gatlinburg",
  		distance: 8.5
  		)
  	expect(new_trail).to_not be_valid
  end

  describe 'Associations' do
    before do 
      @user = User.create(trail_name: 'Dreadful Rebel', email: "d_rebel@hikesmokies.com", password: "happyhiker20")         
      @hiking_trail = HikingTrail.create(name: "Alum Caves Trail", location: "441 North", area: "Gatlinburg / New Found Gap Road", distance: "4.4")
      @hike = Hike.create!(title: "Sunday Night Hike", description: "Our bi-weekly Sunday night hike will be to Chimmney Tops Trail.", hike_date: Time.new(2017,12,20), leader_id: @user.id, hiking_trail_id: @hiking_trail.id)
     

    end

    it 'belongs to a hike' do
      expect(@hike.hiking_trail).to eq(@hiking_trail)
    end

    it 'has many hikes' do
      @hike_2 = Hike.create!(title: "Mt. LeConte", description: "Hike to the cabins on Mt. LeConte", area: "Gatlinburg", distance: '10.5')
      @hiking_trail.hikes << @hike_2
      @hiking_trail.save
      expect(@hiking_trail.hikes.count).to eq(2)
    end
  end

end
