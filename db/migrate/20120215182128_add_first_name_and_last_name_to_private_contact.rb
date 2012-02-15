class AddFirstNameAndLastNameToPrivateContact < ActiveRecord::Migration
  def change
    add_column :private_contacts, :first_name, :string
    add_column :private_contacts, :last_name, :string
  end
end
