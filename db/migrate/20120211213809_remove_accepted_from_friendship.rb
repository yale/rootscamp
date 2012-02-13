class RemoveAcceptedFromFriendship < ActiveRecord::Migration
  def up
    remove_column :friendships, :accepted
  end

  def down
    add_column :friendships, :accepted, :boolean
  end
end
