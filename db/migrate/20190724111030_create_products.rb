class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string          :name, null: false  
      t.text            :description
      t.string          :size, null: false
      t.string          :brand
      t.integer         :status, null: false
      t.boolean         :shipping_fee, null: false
      t.string          :shipping_method, null: false
      t.string          :ship_from, null: false
      t.string          :shipping_date, null: false
      t.integer         :price, null: false 
    end
  end
end