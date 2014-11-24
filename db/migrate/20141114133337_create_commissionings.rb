class CreateCommissionings < ActiveRecord::Migration
  def change
    create_table :commissionings do |t|
      t.string :label
      t.text :description
      t.integer :client_id

      t.timestamps
    end
  end
end
