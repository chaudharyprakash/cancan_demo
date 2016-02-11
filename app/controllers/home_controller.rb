class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def all_users
    @users = User.all
  end
  
  def show
    @user = User.find_by_id(params[:id])
  end
end
