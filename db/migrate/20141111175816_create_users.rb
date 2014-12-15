class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :ctps
      t.string :ci
      t.string :cpf
      t.string :pis
      t.string :reg

      t.timestamps
    end
  end
end
