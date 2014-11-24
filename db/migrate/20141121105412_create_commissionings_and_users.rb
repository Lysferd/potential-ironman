class CreateCommissioningsAndUsers < ActiveRecord::Migration
  def change
    create_table :commissionings_users, id: false do |t|
      t.belongs_to :commissioning
      t.belongs_to :user
    end
  end
end
