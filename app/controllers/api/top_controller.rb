class Api::TopController < ApplicationController
  def index
    category = Category.new
    child_id = params[:child_id].to_i
    @smallcategories = Category.where(child_id: child_id).take(14)
    respond_to do |format|
      format.json
    end
  end
end