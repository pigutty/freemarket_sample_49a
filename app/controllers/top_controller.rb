class TopController < ApplicationController
  before_action :big_categories
  def index
    category = Category.new
    @bigcategories = Category.where(parent_id:nil, child_id:nil)
    parent_id = params[:parent_id].to_i
    @middlecategories = Category.where(parent_id: parent_id).take(14)
    respond_to do |format|
      format.html
      format.json
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
