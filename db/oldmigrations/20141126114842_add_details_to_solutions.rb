class AddDetailsToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :commissioning_id, :integer
  end
end
