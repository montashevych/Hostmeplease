FactoryBot.define do
  factory :user do
    id { 1 }
    first_name { 'James' }
    password  { '123456' }
    email     { 'ivan@gmail.com' }
    role      { 'consumer' }
  end
end
