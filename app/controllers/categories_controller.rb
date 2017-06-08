class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:id])
    @items = Item.where(category_id: @category.id)
  end
end
