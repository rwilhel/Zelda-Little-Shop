class Patron::OrdersController < Patron::BaseController


  def new

    redirect_to patron_orders_path
  end
end
