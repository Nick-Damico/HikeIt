module HikesHelper

	def brief_description(description)
		description.slice(0, 40) + '...';
	end

	def brief_title(title)
		title.slice(0,33) + '...';
	end

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

	def hike_leader(hike, user)
		if hike.leader_id.nil?
			hidden_field_tag("hike[leader_id]", "#{user.id}", :id => "hike_leader_id")
		else
			hidden_field_tag("hike[leader_id]", "#{hike.leader_id}", :id => "hike_leader_id")
		end
	end

	def hike_users(hike, user)
		if !hike.users.include?(user)
			hidden_field_tag("hike[user_id]", "#{user.id}", :id => "hike_user_id")
		end	
	end

	def night_banner_builder
		content_tag(:div, :class => "hike-status-banner hike-status-night") do
			content_tag(:span, "OverNight", :class => "text-white font-w-100")
		end
	end

	def day_banner_builder
		content_tag(:div, :class => "hike-status-banner hike-status-day") do 
			content_tag(:span, "DayHike", :class => "text-white font-w-100")
		end
	end

	def hike_banner(planned_hike)
		planned_hike.day_hike? ? day_banner_builder : night_banner_builder
	end
end

