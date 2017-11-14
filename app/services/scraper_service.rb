require 'nokogiri'
require 'open-uri'
class ScraperService 

	attr_accessor :url, :doc

	def initialize(url = nil)	
		@url = url
	end

	def get_doc		
		@doc = Nokogiri::HTML(open(self.url))
	end

	def get_tables
		@doc.css('table')
	end

	def get_table_rows(table)
		rows = table.css('tr')
		rows.shift
		rows
	end

	def build_hiking_trails
		get_doc
		tables = get_tables
		HikingTrail::TRAIL_AREAS.each.with_index do |area, i|
			t_rows = get_table_rows(tables[i])
			t_rows.each do |row|
				ht = HikingTrail.new
				ht.area = area
				ht.name = row.css('td')[0].text.split("\n").join(" ")
		
				if !row.css('td a').empty?
					ht.url = row.css('td a').attr('href').value 
				end
				ht.location = row.css('td')[1].text
				ht.distance = row.css('td')[3].text
				ht.elevation_gain = row.css('td')[4].text
				ht.difficulty_rating = row.css('td')[5].text
				ht.feature = Feature.find_or_create_by(title: row.css('td')[2].text.split("\n").join(" "))
				ht.save
			end
			
		end
	end

	def get_image_from_url
		hiking_trails_all = HikingTrail.all
		hiking_trails_all.each do |trail|
			
			if trail.url && trail.image_url.nil?
				doc = Nokogiri::HTML(open(trail.url))
				src = doc.css('h1 + table img').attribute('src').text.split("..").last
				trail.image_url = "http://www.hikinginthesmokys.com" + src
				trail.save
			end
		end
	end

end

# scrapperScrapperService.new("http://www.hikinginthesmokys.com/")