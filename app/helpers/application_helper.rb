module ApplicationHelper

	def title(text)
		content_for :title, "HikeIt | #{text}"
	end
	
end
