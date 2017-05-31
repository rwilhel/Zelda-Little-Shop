class AddCategoriesIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :category, index: true, foreign_key: true
  end
end
