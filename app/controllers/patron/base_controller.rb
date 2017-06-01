class Patron::BaseController < ApplicationController
  before_action :require_patron


  def require_patron
    render file: "/public/404" unless current_patron?
  end
end
