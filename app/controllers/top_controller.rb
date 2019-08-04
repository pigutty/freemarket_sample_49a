class TopController < ApplicationController
  before_action :big_categories
  def index
    category = Category.new
    @bigcategores = Category.where(parent_id:nil, child_id:nil)
    parent_id = params[:parent_id].to_i
    @middlecategories = Category.where(parent_id: parent_id).take(14)
    respond_to do |format|
      format.html
      format.json
    @products = Product.all.order("id ASC")
    end
  end

  def big_categories
    @bigcategories = Category.where(parent_id:nil, child_id:nil)
  end
end
