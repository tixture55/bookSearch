class UserDetailsController < ApplicationController

  def index
    @user = Review.all

  end

  def new
  end
end
