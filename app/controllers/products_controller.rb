class ProductsController < TopController
  before_action :product_view_params, only: [:show, :status]
  def show
    @user_products = Product.where(user_id:@product.user_id).where.not(id:@product.id).limit(6).order('id DESC')
    @related_products = Product.where(category_id:@product.category_id).where.not(id:@product.id).limit(6).order('id DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(listing_params)
  end

  def buy
  end

  def status
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
    @middlecategoryid = @product.category.parent.id
    @bigcategoryid = @product.category.parent.grandparent.id
  end

  def destroy
    @product = Product.find(params[:id])
      if @product.user_id == current_user.id
        @product.images.purge
        @product.delete
        redirect_to controller: 'users', action: 'index'
      end
  end


  private
  def listing_params
    params.require(:product).permit(:name, :description,:category_grandparent_id, :category_parent_id,:category_id, :size_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price, images: []).merge(user_id: current_user.id, purchase_status_id:1)
  end

  def product_view_params
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:user)
    @child_category = Category.find(@product.category.child_id)
    @grand_child_category = Category.find(@child_category.parent_id)
  end

end
