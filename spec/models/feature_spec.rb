require 'rails_helper'

RSpec.describe Feature, type: :model do
  it 'has a valid factory and valid with title' do
  	expect(build(:feature)).to be_valid
  end

  it 'has many hiking trails' do 
  	@feature = build(:feature)
  	@hiking_trail = build(:hiking_trail)
    @feature.hiking_trails << @hiking_trail
    expect(@feature.hiking_trails).to include(@hiking_trail)
  end
  
end
