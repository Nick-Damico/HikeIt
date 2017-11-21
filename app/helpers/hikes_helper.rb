module HikesHelper

	def display_date(hike)
		hike.hike_date.strftime("%B %d, %Y")
	end

	def display_time(hike)
		hike.hike_time.strftime('%r')
	end

end

