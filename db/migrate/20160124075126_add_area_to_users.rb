class AddAreaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :area, :string
    add_column :users, :string, :string
  end
end
