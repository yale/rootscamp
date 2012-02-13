class ChangePrimaryLocationIdToLocationId < ActiveRecord::Migration
  def up
    rename_column :users, :primary_location_id, :location_id
  end

  def down
    rename_column :users, :location_id, :primary_location_id
  end
end
