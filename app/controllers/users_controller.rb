class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success]= "Account created successfully!"

      redirect_to "/dashboard"
    else
      flash[:error] = "U gun dun goofed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
