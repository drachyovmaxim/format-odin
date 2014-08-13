# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

titles = ['Sun', 'Moon', 'Storm', 'Scream', 'Howl', 'Life and Death', 'Jupiter', 'Mars', 'Space', 'Tree', 'Face', 'Somebody', 'Lace']

Artist.find_or_create_by_name('Von Goh')

75.times do
	puts Artwork.create(
		title: titles.sample,
		description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore',
		year: rand(1950..2013),
		price: rand(1..1000000),
		artist: Artist.last,
		remote_image_url: 'http://lorempixel.com/500/500/'
	).errors.full_messages
end	
