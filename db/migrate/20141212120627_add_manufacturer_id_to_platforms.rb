class AddManufacturerIdToPlatforms < ActiveRecord::Migration
  def change
    add_column :platforms, :manufacturer_id, :integer
  end
end
