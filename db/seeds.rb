# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(first_name: "test",
                   email: "test@gmail.com",
                   password: "123test",
                   password_confirmation: "123test")
user.skip_confirmation!
user.save
20.times do |n|
  title  = Faker::Company.name
  type = Faker::Lorem.characters(number: 10)
  description = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false,
                                       random_sentences_to_add: 4)
  price = Faker::Number.decimal(l_digits: 3, r_digits: 2)
  active = Faker::Boolean.boolean
  country = Faker::Address.country
  city = Faker::Address.city
  place = user.places.create(title: title,
                description: description,
                price: price,
                is_active: true,
                type: (n % 2) == 0 ? 'Accommodation' : 'Workspace',
                status: (n % 2) == 0 ? :created : :approved,
                lon: "#{n}.6191034",
                lat: 26.2605438)
end
