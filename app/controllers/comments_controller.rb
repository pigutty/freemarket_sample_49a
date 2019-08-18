class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    Comment.create(comment_params)
    redirect_to "/products/#{@product.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(params.permit(:product_id)).merge(user_id:current_user.id)
  end

end
