class Admin::ItemsController < Admin::BaseController

  def new
    @admin = current_user
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def edit
    @user = current_user
    @item = Item.find(params[:id])
  end

end
