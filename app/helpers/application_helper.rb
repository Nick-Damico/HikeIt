module ApplicationHelper

	def title(text)
		content_for :title, "HikeIt | #{text}"
	end

	def logo_path
		if signed_in?
			link_to "HikeIt", static_home_path, :class => "text-white logo-text btn-outline-light btn"
		else
			link_to "HikeIt", root_path, :class => "text-white logo-text btn-outline-light btn"
		end

	end
	
end
