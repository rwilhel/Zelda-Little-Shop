class Admin::OrdersController < Admin::BaseController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @line_items = OrdersItem.where(order_id: @order.id)
    @purchaser = User.find(@order.user_id)
  end

  def destroy
    @order = Order.find(params[:id])
    delete_order_items(OrdersItem.where(order_id: @order.id))
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

  def delete_order_items(order_items)
    order_items.each do |order_item|
      order_item.destroy
    end
  end
end
