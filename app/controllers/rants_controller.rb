class RantsController < ApplicationController

  def index
    @rants = Rant.order(:rant)
    @user = User.find(params[:user_id])

  end

  def new
    @rant = Rant.new
  end

  def show
    @rant = Rant.find(params[:id])
  end

  def create
    # @patient = Patient.find(params[:patient_id])

    @rant = current_user.rants.new(allowed_parameters)
    @rant.user_id = params[:user_id]

    if @rant.save
      flash[:notice] = "Thanks for the rant!"
      redirect_to users_path
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end
end
private

def allowed_parameters
  params.require(:rant).permit(:user_id, :rant, :rant_title)
end