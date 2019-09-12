class CreateUserIdentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_identifications do |t|

      t.string :post_number
      t.integer :prefecture_id
      t.string :city
      t.string :block
      t.string :building
      t.references :user
      t.timestamps
    end
  end
end
