class Patron::UsersController < Patron::BaseController

  def show
    @user = current_user
  end

end
