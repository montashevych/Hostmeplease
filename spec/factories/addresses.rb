FactoryBot.define do
  factory :address do
    country { 'UA' }
    city { 'Rivne' }
    state_region { 'Rivnen\'ska oblast' }
    details { 'Kurchatova, 18Б' }
  end
end
