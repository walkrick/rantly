class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @rant = Rant.new
  end

  def show
    @user = User.find(params[:id])
    # @rant = Rant.all
    @rants = Rant.where(user_id: params[:id])

  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user

    else
      current_user.id != @user
      redirect_to users_path
      flash[:notice] = "Can only edit your own profile!"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(allowed_parameters)
      flash[:notice] = "Profile was updated successfully"
      redirect_to users_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(allowed_parameters.merge({frequency: params[:frequency]}))
    if @user.save
      flash[:notice] = "Thanks for registering "
      redirect_to users_path
    else
      render :new
    end
  end


  private

  def allowed_parameters
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio)
  end


end