class CartsController < ApplicationController
  def new
  end

  def index
    #render plain: params[:item_code].inspect
    @projects = Project.where("id = ? ", params[:id])
    @item_code = Project.where("item_code = ? ", params[:item_code]).where("id <> ?", params[:id])
  
  end

end
