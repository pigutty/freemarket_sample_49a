class CreateProductsImages < ActiveRecord::Migration[5.2]
  def change
    create_table :products_images do |t|

      t.integer :product_id, null:false
      t.string :image_url
    end
  end
end
