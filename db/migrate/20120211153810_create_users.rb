class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :twitter
      t.string :fb_id
      t.integer :primary_location_id

      t.timestamps
    end
  end
end
