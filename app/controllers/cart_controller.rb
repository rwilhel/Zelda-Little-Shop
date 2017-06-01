class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    @item = Item.find(params[:item_id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.quantity_for(@item.id), @item.name)} in your cart!"
    redirect_to request.referrer
  end

  def show
    @cart = session[:cart]
  end

  def destroy
    @item = Item.find(params[:item_id])
    @contents = session[:cart]
    cart = Cart.new(@contents)
    cart.decrease_quantity(@item.id)
    redirect_to request.referrer
  end
end
