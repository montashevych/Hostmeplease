FactoryBot.define do
  factory :place do
    title { 'q' * 9 }
    type { 'Workspace' }
    description { 'q' * 101 }
    price { Faker::Number.number(digits: 4) }
    status { :created }
    is_active { true }
    lon { 50.6191034 }
    lat { 26.2605438 }
  end

  trait :with_address do
    address_attributes { attributes_for(:address) }
  end

  trait :with_picture do
    pictures_attributes { [attributes_for(:picture)] }
  end
end
