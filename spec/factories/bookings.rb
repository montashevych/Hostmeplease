FactoryBot.define do
  factory :booking do
    place { nil }
    user { nil }
    confirmed { true }
  end
end
