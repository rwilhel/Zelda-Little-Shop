class Admin::OrdersController < Admin::BaseController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @line_items = OrdersItem.where(order_id: @order.id)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to request.referrer
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: "Completed")
    redirect_to request.referrer
  end

  private

  def order_params
    params.require(:order).permit(:id, :status)
  end
end
