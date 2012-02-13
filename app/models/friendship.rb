class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  def confirm!
    update_attribute(:status, 2)
  end

  def accepted?
    status == 2
  end

  def declined?
    status == 3
  end

  def self.between friender, friendee
    find(:first, :conditions => { :user_id => friender, :friend_id => friendee })
  end
end
