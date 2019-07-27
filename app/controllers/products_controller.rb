class ProductsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @product = Product.new(listing_params)
  end

  def buy
  end

  private

  def listing_params
    params.require(:product).permit(:name)
  end
end
