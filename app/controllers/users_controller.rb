class UsersController < ApplicationController

  def new
    @user = User.new


  end
def index

end

  def create
    @user = User.new(allowed_parameters.merge({frequency: params[:frequency]}))
    if @user.save
      redirect_to "/"
    else
      render :new
    end
  end


  private

  def allowed_parameters
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio)
  end





end