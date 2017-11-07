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

end
