class AddDetailsToPermissions < ActiveRecord::Migration
  def change
    add_column :permissions, :label, :string
    add_column :permissions, :mode, :integer
  end
end
