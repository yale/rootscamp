# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :private_contact do
    association :user
    association :contact_user, :factory => :user
  end
end
