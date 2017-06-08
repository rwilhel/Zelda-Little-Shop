class Patron::UsersController < Patron::BaseController

  def show
    @user = current_user
    @orders = Order.where(user_id: @user.id).count
    @total = Cart.new(Order.where(user_id: @user.id)).total_spent
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:user_updated] = "You successfully updated #{@user.username}'s Profile."
      redirect_to patron_user_path(@user)
    else
      redirect_to edit_patron_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
