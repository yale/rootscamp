class SplitNameIntoFirstAndLast < ActiveRecord::Migration
  def up
    remove_column :users, :name
    add_column :users, :first, :string
    add_column :users, :last, :string
  end

  def down
    add_column :users, :name, :string
    remove_column :users, :first
    remove_column :users, :last
  end
end
