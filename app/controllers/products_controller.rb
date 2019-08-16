class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:user)
    @child_category = Category.find(@product.category.child_id)
    @grand_child_category = Category.find(@child_category.parent_id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(listing_params)
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
    params.require(:product).permit(:name, :description, :category_id, :size_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price, images: [])
  end

end
