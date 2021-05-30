FactoryBot.define do
  factory :user do
    id        { 1 }
    FirstName { 'James' }
    LastName  { 'Bond' }
    password  { '123456' }
    email     { 'ivan@gmail.com' }
    role      { 'consumer' }
  end
end
