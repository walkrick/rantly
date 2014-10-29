class SearchesController < ApplicationController

  def show
    @user_results = User.where("first_name LIKE :first_name or last_name LIKE :last_name or username LIKE :username" , {first_name: "%#{params[:query]}%", last_name: "%#{params[:query]}%", username: "%#{params[:query]}%" })
    @rant_results = rant.where("first_name LIKE :first_name or last_name LIKE :last_name or username LIKE :username" , {first_name: "%#{params[:query]}%", last_name: "%#{params[:query]}%", username: "%#{params[:query]}%" })

    @rant = Rant.new
  end


end
