class ProductsController < TopController
  skip_before_action :authenticate_user!, only: [:search]
  before_action :set_product, only: [:show,:edit,:update,:status,:destroy] # 対象となる商品を設定

  def search
    @q = Product.search(search_params)
    @keyword =  search_params[:name_cont]
    if params[:search] != nil
      @order_id = params[:search][:search_order].to_i
      order_name = SearchOrder.find(@order_id).name
      order_name != nil ? @q.sorts = order_name : @q.sorts =[]
    end
    @products = @q.result(distinct: true).page(params[:page]).per(100)
    @bigcategoryid =params[:q][:category_grandparent_id_eq].to_i
    @middlecategoryid= params[:q][:category_parent_id_eq].to_i
    @smallcategoryid = params[:q][:category_id_eq].to_i
  end

  def show
    if current_user != @product.user
      @comments = @product.comments.includes(:user)
      @user_products = Product.where(user_id:@product.user_id).where.not(id:@product.id).limit(6).order('id DESC')
      @related_products = Product.where(category_id:@product.category_id).where.not(id:@product.id).limit(6).order('id DESC')
    else
      redirect_to status_product_path(@product.id)
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(listing_params)
    redirect_to root_path
  end

  def buy
  end
  
  def status
    @comments = @product.comments.includes(:user)
  end

  def edit
    if @product.user == current_user
      @product = Product.find(params[:id])
      @bigcategory_id = @product.category.parent.grandparent.id
      @middlecategory_id = @product.category.parent.id
    else
      redirect_to root_path
    end
  end


  def destroy
    if @product.user == current_user
      @product.images.purge
      @product.delete
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def update
    if @product.user == current_user
      @product.update(listing_params)
    else
      redirect_to root_path
    end
    redirect_to root_path
  end

  def set_product
    @product = Product.find(params[:id])
  end

  private
  def listing_params
    params.require(:product).permit(:name, :description,:category_grandparent_id, :category_parent_id,:category_id, :size_id, :status_id, :shipping_fee_id, :shipping_method_id, :prefecture_id, :shipping_date_id, :price, images: []).merge(user_id: current_user.id, purchase_status_id:1)
  end
  
  def search_params
    params.require(:q).permit(:search_order,:name_cont,:brand_cont,:size_id_eq,:status_id_eq,:shipping_fee_id_eq,:purchase_status_id_eq,:category_grandparent_id_eq,:category_parent_id_eq,:category_id_eq,:price_lteq,:price_gteq)
  end
end
