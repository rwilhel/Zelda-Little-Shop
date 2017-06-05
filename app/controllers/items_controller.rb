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

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:item_updated] = "You successfully updated #{@item.name}."
      redirect_to admin_items_path
    else
      flash[:item_update_failure] = "Error. Item #{@item.name} not updated."
      redirect_to request.referrer
    end
  end

  private

  def item_params
  params[:item][:price] = params[:item][:price].to_i
  params[:item][:category_id] = Category.find(params[:item][:category_id].to_i).id
  params.require(:item).permit(:name, :description, :price, :category_id)
  end
end
