class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :ctps, :string
    add_column :users, :ci, :string
    add_column :users, :cpf, :string
    add_column :users, :pis, :string
    add_column :users, :reg, :int
    add_column :users, :permission_id, :integer
  end
end
