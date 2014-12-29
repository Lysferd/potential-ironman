class AddModeToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :modes, :hstore, default: { }, null: false
  end
end
