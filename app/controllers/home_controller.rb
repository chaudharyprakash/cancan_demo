class HomeController < ApplicationController
  def all_users
    @users = User.all
  end
  
  def show
    @user = User.find_by_id(params[:id])
  end
end
