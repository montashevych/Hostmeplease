FactoryBot.define do
  factory :address do
    country { Faker::Address.country }
    city { Faker::Address.city }
    state_region { Faker::Address.state }
    details { Faker::Address.street_address }
  end
end
