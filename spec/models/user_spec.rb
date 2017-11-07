require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "has a valid User factory with an email and password" do
  	expect(build(:user)).to be_valid
  end

  it "is invalid without an email" do
  	expect(build(:user_invalid)).to_not be_valid
  end

  it "is invalid without a valid email (ex. user@example.com)"

  it "is invalid without a password"

  it "is invalid without a password length between 8 - 20 characters"

  it "encrypts the password on persisting the user to database"


end
