class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :label
      t.text :description
      t.integer :type_id

      t.timestamps
    end
  end
end
