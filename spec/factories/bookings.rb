FactoryBot.define do
  factory :booking do
    place { nil }
    user { nil }
    confirmed { true }
    cancelled { false }
  end
end
