class ProductsController < ApplicationController
  def show

  end

  def new
    @product = Product.new
    @category = Category.find(params[:id])
    # binding.pry
    # categories = @category.children
    # childrencategories =@category.grandchildren
    
    # @categories = [
    #   @category,
    #   @category.children,
    #   @category.children.map { |category| category.children }
    # ]
  end

  def create
    @product = Product.create(listing_params)
    
  end

  def buy
  end

  private
  def listing_params
    params.require(:product).permit(:name, :description, :category_id, :size_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price, images: [])
  end

end