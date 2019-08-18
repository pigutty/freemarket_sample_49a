class ProductsController < TopController
  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:user)
    @child_category = Category.find(@product.category.child_id)
    @grand_child_category = Category.find(@child_category.parent_id)
    @user_products = Product.where(user_id:@product.user_id).where.not(id:@product.id).limit(6).order('id DESC')
    @related_products = Product.where(category_id:@product.category_id).where.not(id:@product.id).limit(6).order('id DESC')
    # binding.pry
  end

  def new
    @product = Product.new
  end

  def create
    binding.pry
    @product = Product.create(listing_params)
    binding.pry
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
