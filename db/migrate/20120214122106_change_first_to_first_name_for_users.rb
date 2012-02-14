class ChangeFirstToFirstNameForUsers < ActiveRecord::Migration
  def up
    rename_column :users, :first, :first_name
    rename_column :users, :last, :last_name
  end

  def down
    rename_column :users, :first_name, :first
    rename_column :users, :last_name, :last
  end
end
