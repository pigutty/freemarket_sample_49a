class TopController < ApplicationController
  before_action :big_categories
  def index
    category = Categoryactive.new
    @bigcategories = Categoryactive.where(parent_id:nil, child_id:nil)
    parent_id = params[:parent_id].to_i
    @middlecategories = Categoryactive.where(parent_id: parent_id).take(14)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def big_categories
    @bigcategories = Categoryactive.where(parent_id:nil, child_id:nil)
  end
end
