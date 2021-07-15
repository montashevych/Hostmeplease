FactoryBot.define do
  factory :user do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    password    { 'password' }
    password_confirmation { 'password' }
    sequence(:id) { |n| n }
    email       { Faker::Internet.unique.email }
    role        { 'consumer' }
    phone_number { Faker::PhoneNumber.phone_number}

    trait :confirmed do
      confirmed_at { 2.minutes.ago }
    end
  end
end
