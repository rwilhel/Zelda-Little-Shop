class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin?, :current_member?

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_admin?
      current_user && current_user.admin?
    end

    def current_member?
      current_user && current_user.member?
    end
    
end
