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

	def display_notes(hike)
		if !hike.notes.empty?
			@content = content_tag(:h4, "Notes:", :class => "notes-header font-w-100 color-grey-red")
			@content << content_tag(:p, "#{hike.notes}", :class => "notes-p")
		end
	end

	def display_more_info(trail)
		trail_url = trail.url ? trail.url : "http://www.hikinginthesmokys.com/"
		button_to "More Info", trail_url, :class => "btn btn-color-sign_up text-white mt-3"
	end


end
