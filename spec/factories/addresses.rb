FactoryBot.define do
  factory :address do
    country { 'UA' }
    city { 'Rivne' }
    state_region { 'Rivnen\'ska oblast' }
    details { 'Kurchatova, 18Б' }
    lon { 50.6191034 }
    lat { 26.2605438 }
  end
end
