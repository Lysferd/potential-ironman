class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :label
      t.text   :description

      t.timestamps
    end
  end
end
