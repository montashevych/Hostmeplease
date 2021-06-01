FactoryBot.define do
  factory :place do
    title { Faker::Company.name }
    type { 'office' }
    description { Faker::Lorem.paragraphs }
    price { Faker::Number.number(digits: 4) }
    active { true }
  end
end
