class Patron::OrdersController < Patron::BaseController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new(user_id: current_user.id)
    if @order.save
      create_join_table_entries(@order)
      flash[:order_success] = "Order was successfully placed"
      redirect_to patron_orders_path
    else
      redirect_to cart_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def create_join_table_entries(order)
    @cart = session[:cart]
    @cart.each_pair do |item, quantity|
      OrdersItem.create!(order_id: order.id, item_id: item.to_i, quantity: quantity )
    end
  end

end
