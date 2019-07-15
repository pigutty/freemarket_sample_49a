class TopController < ApplicationController
  def index
    category = Categoryactive.new
    @bigcategories = Categoryactive.where(parent_id:"null", child_id:"null")
    parent_id = params[:parent_id].to_i
    proto_category = Categoryactive.where(parent_id: parent_id)
    @middlecategories = []
    number = 0
    proto_category.each_with_index do |e,number|
      if number < 14
        @middlecategories << proto_category[number]
      else
        return true
      end
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
end
