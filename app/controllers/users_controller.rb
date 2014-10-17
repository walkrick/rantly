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
    @rants = Rant.where(user_id: params[:id])
    @rant = Rant.new


  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to user_path
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
      redirect_to root_path
      flash[:notice] = "Thanks for registering "
    else
      render :new
    end
  end

  def destroy
    @rant = Rant.find(params[:user.id])
    @rant.destroy!
    flash[:notice] = "Rant was deleted successfully"
    redirect_to root_path

  end


  private

  def allowed_parameters
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :picture, :image)
  end


end