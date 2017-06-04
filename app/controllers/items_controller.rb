class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @admin = current_user
    @item = Item.new(name: params[:item][:name],
                        description: params[:item][:description],
                        price: params[:item][:price].to_i,
                        category_id: params[:item][:category].to_i)
    if @item.save
      flash[:item_creation] = "You successfully created #{@item.name}"
      redirect_to admin_user_path(@admin)
    else
      redirect_to new_admin_item_path
    end
  end

  private

  def item_params
  end
end
