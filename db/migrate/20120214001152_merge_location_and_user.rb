class MergeLocationAndUser < ActiveRecord::Migration
  def up
    add_column :users, :lat, :integer
    add_column :users, :long, :integer
    add_column :users, :raw_location, :string
    remove_column :users, :location_id
    drop_table :locations
  end

  def down
    remove_column :users, :lat
    remove_column :users, :long
    remove_column :users, :raw_location
    add_column :users, :location_id, :integer
    create_table "locations", :force => true do |t|
      t.integer  "lat"
      t.integer  "long"
      t.string   "state"
      t.string   "zip"
      t.string   "zip_suffix"
      t.string   "street"
      t.string   "city"
      t.string   "raw_loc"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.integer  "user_id"
    end
  end
end
