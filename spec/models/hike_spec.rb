require 'rails_helper'

RSpec.describe Hike, type: :model do
  it 'has a valid factory validates with title and description' do
  	expect(build(:hike)).to be_valid
  end

  it 'is invalid without title' do
  	expect(build(:hike, title: nil)).to_not be_valid
  end

  it 'is invalid without description' do
  	expect(build(:hike, description: nil)).to_not be_valid
  end

  it 'is invalid with a description character length greater than 390' do
  	hike = build(:hike, 
  		description: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your room"
  		)
  	expect(hike).to_not be_valid
  end

  it 'is invalid with a hike date before todays date' do
  	expect(build(:hike, hike_date: Time.new(2016))).to_not be_valid
  end

  it 'is invalid with notes character count greater than 200' do
  	hike = build(:hike,
  		notes: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a larger."
  		)
  	expect(hike).to_not be_valid
  end

  it 'is invalid without a date' do
  	expect(build(:hike, hike_date: nil)).to_not be_valid
  end
end
