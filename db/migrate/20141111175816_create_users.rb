class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.string :ctps
      t.string :ci
      t.string :cpf
      t.string :pis
      t.string :reg
      t.string :auth_token
      t.integer :role_id

      t.timestamps
    end
  end
end
