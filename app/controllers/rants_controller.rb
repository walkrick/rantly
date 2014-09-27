class RantsController < ApplicationController

  def index
    @rants = Rant.order(:rant)
  end

  def new
    @rant = Rant.new
  end

  def show
    @rant = Rant.find(params[:id])
  end

  def create
    @rant = Rant.new(allowed_parameters)
    if @rant.save
      flash[:notice] = "Thanks for the rant! "
      redirect_to users_path
    else
      render :new
    end
  end
end
private

def allowed_parameters
  params.require(:rant).permit(:user_id, :rant, :rant_title)
end