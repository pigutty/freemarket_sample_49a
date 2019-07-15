class Api::TopController < ApplicationController
  def index
    category = Categoryactive.new
    child_id = params[:child_id].to_i
    proto_category = Categoryactive.where(child_id: child_id)
    @smallcategories = []
    number = 0
    proto_category.each_with_index do |e,number|
      if number < 14
        @smallcategories << proto_category[number]
      else
        return true
      end
    end
    respond_to do |format|
      format.json
    end
  end
end
