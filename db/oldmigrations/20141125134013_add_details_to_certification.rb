class AddDetailsToCertification < ActiveRecord::Migration
  def change
    add_column :certifications, :label, :string
    add_column :certifications, :description, :text
    add_column :certifications, :user_id, :integer
    add_column :certifications, :product_id, :integer
  end
end
