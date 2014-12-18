class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :label
      t.string :homepage

      t.timestamps
    end
  end
end
