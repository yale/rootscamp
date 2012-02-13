class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :lat
      t.integer :long
      t.string :state
      t.string :zip
      t.string :zip_suffix
      t.string :street
      t.string :city
      t.string :raw_loc

      t.timestamps
    end
  end
end
