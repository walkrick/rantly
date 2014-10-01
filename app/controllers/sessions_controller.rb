class SessionsController < ApplicationController
  skip_before_action :ensure_current_user


  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password_digest])
      session[:user_id] = @user.id
      flash[:notice] = "Hello again, #{@user.first_name} #{@user.last_name}"
      redirect_to users_path
    else
      flash[:error] = "Username/password is invalid"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end


end
