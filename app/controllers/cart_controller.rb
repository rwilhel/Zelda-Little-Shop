class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  #create before action for @item
  
  def create
    @item = Item.find(params[:item_id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.quantity_for(@item.id), @item.name)} in your cart!"
    redirect_to request.referrer
  end

  def show
    @cart = session[:cart]
    staged_cart = Cart.new(@cart)
    @total = staged_cart.total
  end

  def destroy
    @item = Item.find(params[:item_id])
    @contents = session[:cart]
    cart = Cart.new(@contents)
    cart.decrease_quantity(@item.id)
    redirect_to request.referrer
  end

  def update
    @item = Item.find(params[:item_id])
    session[:cart].delete(@item.id.to_s)
    @contents = session[:cart]
    @cart = Cart.new(@contents)
    @total = @cart.total
    flash[:danger_zone] = "Succesfully Removed #{view_context.link_to(@item.name, item_path(@item))} from cart."
    redirect_to request.referrer
  end
end
