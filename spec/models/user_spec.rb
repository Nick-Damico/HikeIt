require 'rails_helper'

RSpec.describe User, type: :model do
  
	it "has a valid User factory with an email and password" do
		expect(build(:user)).to be_valid
	end

	it "is invalid without an email" do
		expect(build(:user, email: nil)).to_not be_valid
	end

	it "is invalid without a valid email (ex. user@example.com)" do
		user = build(:user)
		expect(build(:user, email: "#{user.trail_name}.example.com")).to_not be_valid
	end

	describe "password" do
	  it "is invalid without a password" do
	  	expect(build(:user, password: nil)).to_not be_valid
	  end

	  describe "when password length is invalid" do

	  	it "is invalid with a password length < 8 characters" do
	  		expect(build(:user, password: "happy")).to_not be_valid
	  	end	

	  	it "is invalid with a password length > 20 characters" do
	  		expect(build(:user, password: "123456789101112131411")).to_not be_valid
	  	end

	  end
	  

	  it "encrypts the password on persisting the user to database" do
	  	user = build(:user)
	  	user.save
	  	expect(user.encrypted_password).to_not eq(user.password)
	  end

	end

	it "is invalid with trail_name that is not unique" do
		user_1 = build(:user)
		user_1.save
		user_2 = build(:user, trail_name: "#{user_1.trail_name}", email: "newuser@example.com")
		expect(user_2).to_not be_valid
	end

	it "is invalid with a bio length greater than 160 characters" do
		user = build(:user,
					 bio: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right a"
			)
		expect(user).to_not be_valid
	end

	it "is invalid with a location length greater than 21 characters" do
		user = build(:user, 
			location: "Winchester-on-the-Severn1, Maryland"
			)
		expect(user).to_not be_valid
	end
	describe 'relationship to hikes' do
		it 'has many hikes' do
			user = User.reflect_on_association(:hikes)
			expect(user.macro).to eq(:has_many)
			
		end
	end

end
