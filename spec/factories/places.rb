FactoryBot.define do
  factory :place do
    title { 'q' * 9 }
    type { 'Workspace' }
    description { Faker::Lorem.paragraphs }
    price { Faker::Number.number(digits: 4) }
    status { :created }
    is_active { true }
    lon { 50.6191034 }
    lat { 26.2605438 }
  end
end
