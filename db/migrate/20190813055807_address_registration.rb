class AddressRegistration < ActiveRecord::Migration[5.2]
  def change
    create_table :address_registrations do |t|
      t.string :family_name, null:false
      t.string :first_name, null:false
      t.string :family_furigana, null:false
      t.string :first_furigana, null:false
      t.integer :postal_code, null:false
      t.integer :prefecture_id, null:false
      t.string :city, null:false
      t.string :block, null:false
      t.string :building
      t.integer :phone_number, null:false
      t.references :user
      t.timestamps
    end
  end
end
