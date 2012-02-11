class User < ActiveRecord::Base
  validates_presence_of :name, :email
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :pending_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => { :status => 0 }
  has_many :friend_requests,
           :through => :friendships,
           :source => :friend,
           :conditions => { :status => 1 }
  
  def friend_request user
    unless self == user or Friendship.exists?(:user_id => self, :friend_id => user)
      transaction do
        Friendship.create(:user => self, :friend => user)
        Friendship.create(:user => user, :friend => self, :status => 1)
      end
    end
  end
end
