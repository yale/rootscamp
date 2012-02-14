FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email {|u| Faker::Internet.email(u.last_name)}
    twitter {|u| "@#{Faker::Internet.user_name(u.first_name)}"}
    phone Faker::PhoneNumber.phone_number
    fb_id {|u| "@#{Faker::Internet.user_name(u.first_name + u.last_name)}"}
    raw_location Faker::Address.city
  end
end
