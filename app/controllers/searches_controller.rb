class SearchesController < ApplicationController

  def new
    @user = User.new
    @rant = Rant.new

  end


  def show
    @user_results = User.where("first_name LIKE :first_name or last_name LIKE :last_name or username LIKE :username" , {first_name: "%#{params[:query]}%", last_name: "%#{params[:query]}%", username: "%#{params[:query]}%" })
    @rant_results = Rant.where("rant LIKE :rant" , {rant: "%#{params[:query]}%" })
    @rant = Rant.new
    @rants = Rant.where(user_id: params[:id])

  end


end
