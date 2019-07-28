class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
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
    params.require(:product).permit(:name, :description)
  end

end
