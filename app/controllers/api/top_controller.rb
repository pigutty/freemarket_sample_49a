class Api::TopController < ApplicationController
  def index
    if params[:parent_id] != nil
      parent_id = params[:parent_id].to_i
      @middlecategories = Category.where(parent_id: parent_id).take(14)
      respond_to do |format|
        format.json
      end
    else
      child_id = params[:child_id].to_i
      @smallcategories = Category.where(child_id: child_id).take(14)
      respond_to do |format|
        format.json
      end
    end
  end
end
