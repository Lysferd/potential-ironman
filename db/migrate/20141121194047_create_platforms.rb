class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :label
      t.integer :platform_id

      t.timestamps
    end
  end
end
