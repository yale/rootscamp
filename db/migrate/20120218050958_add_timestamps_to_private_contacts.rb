class AddTimestampsToPrivateContacts < ActiveRecord::Migration
  def change
    add_column(:private_contacts, :created_at, :datetime)
    add_column(:private_contacts, :updated_at, :datetime)
  end
end
