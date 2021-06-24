FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    first_name  { Faker::Name.first_name }
    password    { Faker::Internet.password(min_length: 6) }
    email       { Faker::Internet.unique.email }
  end
end
