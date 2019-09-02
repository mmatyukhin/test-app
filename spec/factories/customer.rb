FactoryBot.define do
  factory :customer do
    name        { Faker::Name.name }
    description { Faker::Lorem.word }
    phone       { Faker::PhoneNumber.phone_number }
    banned      { false }
  end
end
