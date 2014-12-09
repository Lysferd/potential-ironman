class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :ctps
      t.string :ci
      t.string :cpf
      t.string :pis
      t.string :reg
      t.string :permission_id

      t.timestamps
    end
  end
end
