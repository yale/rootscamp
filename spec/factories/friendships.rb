# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friendship do
    user_id 1
    friend_id 2
    accepted true
  end

  factory :pending_friendship do
    user_id 1
    friend_id 2
    accepted true
  end
end
