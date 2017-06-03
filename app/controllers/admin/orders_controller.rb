class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to request.referrer
  end


end
