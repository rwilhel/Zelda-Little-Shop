class SessionsController < ApplicationController

  def show
  end

  def new
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
