class AddModeToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :rules, :hstore, default: { }, null: false
  end
end
