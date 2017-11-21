module HikingTrailsHelper

	def trail_image_tag(trail, view)		
		if trail.image_url
			if view == 'index'
				image_tag "#{trail.image_url}", :class => "img-fluid w-100 card-img" 
			elsif view == 'show'
				image_tag "#{trail.image_url}", :class => 'img-thumbnail'
			end
		else
			image_tag "btn-find-hike", :options => { :size => "280x200" }, :class => "img-fluid card-img w-100"
		end
	end

	def trail_name(trail)
		trail.name
	end

	def trail_area(trail)
		trail.area
	end


end
