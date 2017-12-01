# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Instantiates the ScraperService
scraper = ScraperService.new("http://www.hikinginthesmokys.com/location.htm")
# Scraper will collect data from the above URL and create HikingTrail class instances
scraper.build_hiking_trails
# Scraper will gather images for the instances of the HikingTrail model and add them to the database if image_url is nil.
scraper.get_image_from_url

