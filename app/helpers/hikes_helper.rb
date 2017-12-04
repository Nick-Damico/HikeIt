module HikesHelper

	def display_date(hike)
		hike.hike_date.strftime("%B %d, %Y")
	end

	def display_time(hike)
		hike.hike_time.strftime('%r')
	end

	def hike_join_status(hike, user)
		if hike.users.include?(user) || hike.leader == user			
			content_tag(:span, "You've Joined", :class => "btn card-btn btn-color-login joined-btn rounded-0 w-75") 
		else
			submit_tag("Join", :class => "card-btn btn btn-login-form text-white rounded-0 w-50")
		end
	end

	def brief_description(description)
		description.slice(0, 40) + '...';
	end

	def brief_title(title)
		title.slice(0,33) + '...';
	end
end

