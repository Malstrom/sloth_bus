class AddRoleToUser < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :role, :integer
  end

  def down
    remove_column :users, :role
  end
end