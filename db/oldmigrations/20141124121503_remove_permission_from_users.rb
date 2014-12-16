class RemovePermissionFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :permission, :integer
  end
end
