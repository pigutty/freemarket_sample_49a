class AddressRegistration < ActiveRecord::Migration[5.2]
  def change
    create_table :address_registrations do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_furigana
      t.string :first_furigana
      t.string :postal_code
      t.integer :prefecture_id, null:false
      t.string :city, null:false
      t.string :block, null:false
      t.string :building
      t.string :phone_number
      t.references :user
      t.timestamps
    end
  end
end
