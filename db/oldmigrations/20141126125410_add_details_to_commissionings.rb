class AddDetailsToCommissionings < ActiveRecord::Migration
  def change
    add_column :commissionings, :activate_users, :string, array: true, default: '{}'
    add_column :commissionings, :owner_id, :integer
    add_column :commissionings, :authorized, :bool
  end
end
