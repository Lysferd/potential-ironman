class RemovePermissionIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :permission_id
  end
end
