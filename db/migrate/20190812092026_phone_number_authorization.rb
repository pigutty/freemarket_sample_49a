class PhoneNumberAuthorization < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_number_authorizations do |t|
      t.string :telephone
      t.references :user
      t.timestamps
    end
  end
end
