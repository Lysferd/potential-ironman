class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :label
      t.text :description
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
