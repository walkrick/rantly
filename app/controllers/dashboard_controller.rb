class DashboardController < ApplicationController

  before_action :ensure_current_user


  def show
    @user = User.find(params[:id])
    @rants = Rant.all.order('created_at DESC').where("user_id != #{current_user.id}")
    @rant = Rant.new

  end


  def index
    @users = User.all
    @rant = Rant.new
  end


end