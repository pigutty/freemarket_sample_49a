class PhoneNumberAuthorization < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_number_authorizations do |t|
      t.integer :telephone, unique:true, null:false
      t.references :user
      t.timestamps
    end
  end
end
