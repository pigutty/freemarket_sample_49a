class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string          :name, null: false  
      t.text            :description
      t.integer         :size_id, null: false
      t.string          :brand
      t.integer         :status_id, null: false
      t.boolean         :shipping_fee_id, null: false
      t.integer         :shipping_date_id, null: false
      t.integer         :price, null: false 
      t.integer         :category_id
      t.integer         :user_id
      t.integer         :prefecture_id, null: false
      t.integer         :purchase_status_id,derault: 1, null:false
    end
  end
end
