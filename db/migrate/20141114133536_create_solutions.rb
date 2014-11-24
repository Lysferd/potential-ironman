class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :label
      t.text :description
      t.references :product, index: true
      t.references :platform, index: true

      t.timestamps
    end
  end
end
