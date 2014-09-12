# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

titles = ['Алексей Кио', 'Глаз искроментый', 'Чернуха', 'Поганка', 'Посмотри у себя в штанах']

Artist.find_or_create_by(name: 'Саша Захаренко', bio: 'В 1901 году он окончил Технический университет Брно по специальности «инженер», позже перебрался в Берлин, где начал изучать психологию и философию и увлекся идеями Фридриха Ницше и Эрнста Маха. Последнему и была посвящена кандидатская диссертация Музиля, которую он писал под руководством Карла Штумпфа — известного немецкого психолога, чьи работы традиционно считаются первыми ласточками феноменологии и гештальтпсихологии. Труд Музиля произвел впечатление на академическое сообщество, и ему вскоре предложили пройти процедуру хабилитации — аналог присуждения степени доктора наук в России. Однако молодой ученый к тому времени уже успел опубликовать роман «Душевные смуты воспитанника Терлеса» и решил полностью посвятить себя литературе; в науку он так и не вернулся.')

def fixtures_path
  Rails.root.join("db/fixtures/")
end

def image
  File.open Dir["#{fixtures_path}*.jpg"].sample, 'r'
end

5.times do
	puts Artwork.create(
		title: titles.sample,
		description: 'Кажущееся постоянство в любой момент сменяет непредсказуемость. Если сейчас всё хорошо, значит пришло время.',
		year: rand(1950..2013),
		price: rand(10000..20000),
		artist: Artist.last,
		image: image
	).errors.full_messages
end
