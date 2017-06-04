class Admin::ItemsController < Admin::BaseController

  def new
    @admin = current_user
    @item = Item.new
  end

end
