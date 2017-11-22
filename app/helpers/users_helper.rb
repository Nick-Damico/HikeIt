module UsersHelper

	def display_profile_img(user) 
		if user.profile_image.nil? || user.profile_image.empty?
			image_tag "profile-temp.svg", :class => "profile_pic rounded-circle img-thumbnail"
	 	else 
			image_tag "#{user.profile_image}", :class => "profile_pic rounded-circle img-thumbnail" 
		end 
	end

	def hikes_joined(user,hikes)
		@hikes = hikes.select { |hike| hike if hike.leader != user }
	end

end
