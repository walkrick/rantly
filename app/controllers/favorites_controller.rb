class FavoritesController < ApplicationController

  def show

  end

  def create
    Favorite.create!(user_id: current_user.id, rant_id: params[:rant_id])
    redirect_to :back
  end

  def destroy

  end

end
