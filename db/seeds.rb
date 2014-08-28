# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

titles = ['Алексей Кио', 'Глаз искроментый', 'Чернуха', 'Поганка', 'Посмотри у себя в штанах']

Artist.find_or_create_by_name('Саша Захаренко')

def fixtures_path
  Rails.root.join("db/fixtures/")
end

def image
  File.open Dir["#{fixtures_path}*.jpg"].sample, 'r'
end

75.times do
	puts Artwork.create(
		title: titles.sample,
		description: 'Кажущееся постоянство в любой момент сменяет непредсказуемость. Если сейчас всё хорошо, значит пришло время.',
		year: rand(1950..2013),
		price: rand(1..20000),
		artist: Artist.last,
		image: image
	).errors.full_messages
end	
