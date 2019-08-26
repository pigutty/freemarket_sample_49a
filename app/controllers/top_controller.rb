class TopController < ApplicationController
  before_action :big_categories
  def index
    
    @bigcategories = Category.where(parent_id:nil, child_id:nil)
    @products = @bigcategories.map do |category|
      Product.where(category_grandparent_id: category.id).slice(0,4)
    end  

  end

  def big_categories
    @bigcategories = Category.where(parent_id:nil, child_id:nil)
  end

  def show
    id = params[:id].to_i
    @category = Category.find(params[:id])
    case id
    when 1..13 then
      @products = Product.where(category_grandparent_id:id).page(params[:page]).per(100)
      @page = params[:page]
      @categories = @category.children.take(9)
    when 14..158 then
      @products = Product.where(category_parent_id:id).page(params[:page]).per(100)
      @page = params[:page]
      @categories = @category.children.take(9)
    when 159..1325 then
      @products = Product.where(category_id:id).page(params[:page]).per(100)
      @page = params[:page]
    else
      redirect_to root_path
    end
  end
end
