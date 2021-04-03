FactoryBot.define do
  factory :user do
    first_name { Faker }
    last_name  { "Doe" }
    role
    gender { 'male' }
    date_of_birth { '02/08/1991' }
    phone { Faker::PhoneNumber.phone_number }
  end
end
