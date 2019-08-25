class Api::ProductsController < ApplicationController
  def edit
    binding.pry
    product = Product.find(image_params[:id])
    target = image_params[:index].to_i
    product.images[target-1]
  end

  private
  def image_params
    params.permit(:index,:id)
  end
end
