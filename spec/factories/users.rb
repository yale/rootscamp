FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email {|u| Faker::Internet.email(u.name)}
    twitter {|u| "@#{Faker::Internet.user_name(u.name)}"}
    phone Faker::PhoneNumber.phone_number
    fb_id {|u| "@#{Faker::Internet.user_name(u.name)}"}
  end
end
