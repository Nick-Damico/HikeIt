require 'rails_helper'

RSpec.feature 'Add a Hike', :type => :feature do 

	scenario "User is able to Create a Planned Hike" do
		#1. go to the root path a find a button to create a hike
		visit '/'
		#2. Click on the button 'Plan Hike' button
		click_link 'Plan Hike'
		#3. Fill in the 'title' text field with a title for a hike event
		fill_in 'hike_title', with: "Weekly Sunday Morning Hike"
		#4. Fill in a brief description of the planned hike event
		fill_in 'hike_description', with: "Our Weekly Group Hike to a new and fun trail"
		#5. Select from a datetime select the Date for a hike.
		select "hike_hike_date", :from => "organizationSelect"
		#6. Select from a datetime select the Time of the hike.
		select "hike_hike_time", :from => ""
		#7. Select A hiking-trail for this planned hike event.
		select "hike_hiking_trail", :from => ""
		#8.	Fill in any notes for the planned hike.
		fill_in 'hike_notes', with: "It's going to be chilly up there this time of year, bring warm clothing."
		#9. Click 'Create Hike' submit button.
		click_link 'Create Hike'
		#10. Redirect to the hike show page with details of the planned Hike
			 # 10.1. with ( title, description, hike_date, hike_time, notes, hiking_trail.name )
			 expect(page).to have_content('Weekly Sunday Morning Hike')
			 expect(page).to have_content('Our Weekly Group Hike to a new and fun trail')
	end
end