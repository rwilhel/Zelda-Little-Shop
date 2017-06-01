class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    @item = Item.find(params[:item_id])
    @cart.update_quantity(@item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.quantity_for(@item.id), @item.name)} in your cart!"
    redirect_to request.referrer
  end
end
