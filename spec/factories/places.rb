FactoryBot.define do
  factory :place do
    title { Faker::Company.name[0..22] }
    type { 'Workspace' }
    description { Faker::Lorem.paragraphs }
    price { Faker::Number.number(digits: 4) }
    status { :created }
    is_active { true }
  end
end
