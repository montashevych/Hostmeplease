FactoryBot.define do
  factory :place do
    title { Faker::Company.name }
    type { 'Workspace' }
    description { Faker::Lorem.paragraphs }
    price { Faker::Number.number(digits: 4) }
    status { true }
  end
end
