class Hike < ApplicationRecord
	validates :title, :description, :presence => true
	validates :description, :length => { :maximum => 390 }
	validates :notes, :length => { :maximum => 200 }
end
