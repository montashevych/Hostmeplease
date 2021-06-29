FactoryBot.define do
  factory :user do
    first_name  { Faker::Name.name }
    password    { 'password' }
    password_confirmation { 'password' }
    sequence(:id) { |n| n }
    email       { Faker::Internet.unique.email }
    role        { 'consumer' }

    trait :confirmed do
      confirmed_at { 2.minutes.ago }
    end
  end
end
