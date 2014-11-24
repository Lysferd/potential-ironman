class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :label
      t.text :description
      t.timestamp :date_start
      t.timestamp :date_end
      t.references :user, index: true

      t.timestamps
    end
  end
end
