class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:user)
    # binding.pry
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(listing_params)
  end

  def buy
  end

  def destroy
    product = Product.find(params[:id])
      if product.user_id == current_user.id
        product.delete
      end
  end

  private
  def listing_params
    params.require(:product).permit(:name, :description, :category_id, :size_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price)
  end
end
