# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friendship do
    user_id 1
    friend_id 2
    status 3
  end

  factory :pending_friendship, :parent => :friendship do
    user_id 1
    friend_id 2
    status 0
  end

  factory :friendship_request, :parent => :friendship do
    user_id 2
    friend_id 1
    status 1
  end
end
