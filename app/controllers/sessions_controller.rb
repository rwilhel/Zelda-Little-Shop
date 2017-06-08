class SessionsController < ApplicationController

  def show
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}!"
      if current_admin?
        redirect_to admin_user_path
      else
        redirect_to "/dashboard"
      end
    else
      flash[:error] = "U gun dun goofed"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
