class AddDetailsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :commissioning_id, :integer
  end
end
