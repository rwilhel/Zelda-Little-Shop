class Member::BaseController < ApplicationController
  before_action :require_member


  def require_member
    render file: "/public/404" unless current_member?
  end
end
