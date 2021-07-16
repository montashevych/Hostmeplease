# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts('=> Starting seeding')
puts('=> Seeding user')
user = User.new(first_name: "test",
                email: "test@mail.com",
                password: "1q2w3e4r",
                password_confirmation: "1q2w3e4r")
user.skip_confirmation!
user.save!

puts('=> Seeding places')
20.times do |n|
  title  = Faker::Company.name[0..10]
  type = Faker::Lorem.characters(number: 10)
  description = Faker::Lorem.paragraph(sentence_count: 15, supplemental: false,
                                       random_sentences_to_add: 15)
  price = Faker::Number.decimal(l_digits: 3, r_digits: 2)
  active = Faker::Boolean.boolean
  country = Faker::Address.country
  city = Faker::Address.city
  address = Address.new(country: Faker::Address.country,
                      city: Faker::Address.city,
                      state_region: Faker::Address.state,
                      details: Faker::Address.street_address)
  picture = Picture.new(image: Rack::Test::UploadedFile.new(
                      File.open(Rails.root.join('spec/factories/test.png')),
                      'image/png',
                    ))
  place = user.places.create!(title: title,
                description: description,
                price: price.round(2),
                is_active: true,
                type: (n % 2) == 0 ? 'Accommodation' : 'Workspace',
                status: (n % 2) == 0 ? :created : :approved,
                lon: "#{n}.6191034",
                lat: 26.2605438,
                address: address,
                pictures: [picture]
              )
end
puts('=> Seeding is finished')
