class PrivateContact < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact_user, :class_name => 'User'
end
