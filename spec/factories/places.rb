FactoryBot.define do 
    factory :place do
        title { Faker::Company.name }
        place_type { 'Office' }
        description { Faker::Lorem.paragraphs }
        price { Faker::Number.number(digits: 4) }
        active { true }
    end
end