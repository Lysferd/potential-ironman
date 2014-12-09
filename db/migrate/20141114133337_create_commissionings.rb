class CreateCommissionings < ActiveRecord::Migration
  def change
    create_table :commissionings do |t|
      t.string :label
      t.text :description
      t.integer :active_users, array: true, default: []
      t.integer :owner_id
      t.boolean :authorized
      t.integer :client_id

      t.timestamps
    end
  end
end
