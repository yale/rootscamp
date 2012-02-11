class AddStatusToFriendship < ActiveRecord::Migration
  def up
    add_column :friendships, :status, :integer
  end

  def down
    remove_column :friendships, :status
  end
end
