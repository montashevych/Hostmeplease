# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do |n|
  title  = Faker::Address.street_name
  description = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false,
                                       random_sentences_to_add: 4)
  price = Faker::Number.decimal(l_digits: 3, r_digits: 2)
  active = Faker::Boolean.boolean
  country = Faker::Address.country
  city = Faker::Address.city
  place = Place.create(title: title,
                description: description,
                price: price,
                status: active)
end

# places = Place.all
# places.each do |place|
#   place.country.create(country_name: country)
# end
#
# countries = Country.all
# countries.each do |country|
#   country.city.create(city_name: city)
# end


20.times do
  country = Country.create(country_name: Faker::Address.country)
  20.times do
    city = country.city.create(city_name: Faker::Address.city)
  end
end
