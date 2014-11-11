class CreateCommissionings < ActiveRecord::Migration
  def change
    create_table :commissionings do |t|
      t.string :label
      t.text :description

      t.timestamps
    end
  end
end
