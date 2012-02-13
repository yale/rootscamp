class User < ActiveRecord::Base
  validates_presence_of :name
  has_one  :location
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :confirmed_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => [ 'friendships.status = 2' ]
  has_many :pending_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => [ 'friendships.status = 0' ]
  has_many :friend_requests,
           :through => :friendships,
           :source => :friend,
           :conditions => [ 'friendships.status = 1' ]
  accepts_nested_attributes_for :location

  def friend_request user
    unless self == user or Friendship.exists?(:user_id => self, :friend_id => user)
      transaction do
        Friendship.create(:user => self, :friend => user)
        Friendship.create(:user => user, :friend => self, :status => 1)
      end
    end
  end

  def accept! user
    friendship         = Friendship.between(self, user)
    reverse_friendship = Friendship.between(user, self)
    if friendship and reverse_friendship and not reverse_friendship.declined?
      friendship.confirm!
      reverse_friendship.confirm!
    end
  end
end
