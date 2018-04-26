class UserDetailsController < ApplicationController

  def index
    #render plain: params[:user_id].inspect
    
    @ra = Project.joins("LEFT OUTER JOIN reviews ON projects.id = reviews.project_id LEFT OUTER JOIN user_items ON user_items.user_id = reviews.user_id").where("reviews.user_id = ?" , params[:user_id]).select("projects.*, reviews.* , user_items.*")
    
    @r = Project.joins("LEFT OUTER JOIN reviews ON projects.id = reviews.project_id LEFT OUTER JOIN user_items ON user_items.user_id = reviews.user_id").where("reviews.project_id = ?" , params[:id]).select("reviews.* , user_items.*")
  end
  def new
  end
end
