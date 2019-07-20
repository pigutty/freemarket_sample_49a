class TopController < ApplicationController
  def index
    category = Categoryactive.new
    @bigcategories = Categoryactive.where(parent_id:"null", child_id:"null")
    parent_id = params[:parent_id].to_i
    @middlecategories = Categoryactive.where(parent_id: parent_id).take(14)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
