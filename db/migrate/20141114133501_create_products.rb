class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :label
      t.string :version
      t.text :description
      t.integer :product_whitelist, array: true, default: [ ]
      t.integer :platform_whitelist, array: true, default: [ ]
      t.integer :product_dependencies, array: true, default: [ ]
      t.integer :product_type_id
      t.integer :manufacturer_id

      t.timestamps
    end
  end
end
