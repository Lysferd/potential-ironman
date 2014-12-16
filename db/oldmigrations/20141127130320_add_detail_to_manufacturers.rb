class AddDetailToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :label, :string
  end
end
