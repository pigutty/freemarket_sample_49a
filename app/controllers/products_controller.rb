class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @products_images = @product.products_images
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(listing_params)
  end
  def buy
  end

  private
  def listing_params
    params.require(:product).permit(:name, :description, :category_id, :size_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price)
  end

end
