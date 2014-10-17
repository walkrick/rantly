class FollowingRelationshipsController < ApplicationController

  def show
    @rant = Rant.new


  end


  def create
    user = User.find(params[:user_id])
    current_user.followed_users << user
    redirect_to dashboard_path(current_user.id)
  end


end
