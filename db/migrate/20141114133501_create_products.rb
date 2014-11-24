class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :label
      t.text :description
      t.references :type, index: true

      t.timestamps
    end
  end
end
