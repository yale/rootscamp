# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    state Faker::Address.state
    zip Faker::Address.zip_code
    street Faker::Address.street_address
    city Faker::Address.city
  end
end
