class ReplaceFriendshipsWithContacts < ActiveRecord::Migration
  def up
    create_table :private_contacts, :force => true do |t|
      t.integer "user_id"
      t.integer "contact_user_id"
      t.string "phone"
      t.string "email"
      t.string "twitter"
      t.string "raw_location"
    end
    drop_table :friendships
  end

  def down
    drop_table :private_contacts
    create_table "friendships", :force => true do |t|
      t.integer  "user_id"
      t.integer  "friend_id"
      t.datetime "created_at",                :null => false
      t.datetime "updated_at",                :null => false
      t.integer  "status",     :default => 0
    end
  end
end
