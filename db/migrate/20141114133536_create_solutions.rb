class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :label
      t.text :description
      t.integer :commissioning_id
      t.integer :product_id
      t.integer :platform_id

      t.timestamps
    end
  end
end
