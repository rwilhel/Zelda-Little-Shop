class Patron::BaseController < ApplicationController
  before_action :require_patron


  def require_patron
    redirect_to dashboard_path unless current_patron?
  end
end
