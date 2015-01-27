class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :label
      t.text :description
      t.timestamp :date_start
      t.timestamp :date_end
      t.integer :commissioning_id
      t.integer :user_id
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
