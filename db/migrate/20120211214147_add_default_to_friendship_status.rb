class AddDefaultToFriendshipStatus < ActiveRecord::Migration
  def up
    change_column :friendships, :status, :integer, :default => 0
  end

  def down
    change_column :friendships, :status, :integer, :default => nil
  end
end
