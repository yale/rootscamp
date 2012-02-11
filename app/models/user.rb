class User < ActiveRecord::Base
  validates_presence_of :name, :email
  has_many :friendships
  has_many :friends, :through => :friendships
  
  def request user
    self.friends << user
  end
end
