class RantsController < ApplicationController
  before_action :ensure_current_user

  def index
    @rants = Rant.order(:rant)
    @users = User.find(params[:user_id])

  end

  def new
    @rant = Rant.new
  end

  def show
    @user = User.where(id: params[:id])
    @rant = Rant.find(params[:id])
  end

  def create

    @rant = current_user.rants.new(allowed_parameters)
    @rant.user_id = current_user.id

    if @rant.save
      flash[:notice] = "Thanks for the rant!"
      redirect_to dashboard_path(current_user.id)

    else
      # render correct path for user
      render 'users/index'
    end
  end


  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy!
    # flash[:notice] = "Rant was deleted successfully"
    redirect_to :back

  end


  private

  def allowed_parameters
    params.require(:rant).permit(:user_id, :rant, :rant_title)
  end

end