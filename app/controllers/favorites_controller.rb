class FavoritesController < ApplicationController

  def index
     @favorites = Favorite.where(user_id: current_user.id)
    @user = User.find(params[:user_id])
    @rant = Rant.new
  end

  def create
    Favorite.create!(user_id: current_user.id, rant_id: params[:rant_id])
    redirect_to :back
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, rant_id: params[:rant_id])
    @favorite.destroy!
    redirect_to :back
  end
end
