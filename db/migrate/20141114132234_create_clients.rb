class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :label
      t.string :cnpj
      t.string :address1
      t.string :address2
      t.string :zip_code
      t.string :phone
      t.string :contact_name
      t.string :contact_email
      t.string :commercial_contact
      t.string :homepage

      t.timestamps
    end
  end
end
