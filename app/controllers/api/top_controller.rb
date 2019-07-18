class Api::TopController < ApplicationController
  def index
    category = Categoryactive.new
    child_id = params[:child_id].to_i
    @smallcategories = Categoryactive.where(child_id: child_id).take(14)
    respond_to do |format|
      format.json
    end
  end
end
