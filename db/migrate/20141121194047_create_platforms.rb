class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :label
      t.text :description
      t.integer :manufacturer_id

      t.timestamps
    end
  end
end
