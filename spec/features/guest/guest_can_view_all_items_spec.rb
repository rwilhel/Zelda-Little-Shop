require 'rails_helper'

RSpec.describe "guest can view index page" do
  it "displays all existing items" do
    category = Category.create(name: "Potions")
    item = create(:item)
    category2 = Category.create(name: "Food")
    item2 = Item.create(name: "Milk", description: "Feeds the body", price: 2, category_id: 2)

    visit items_path
    expect(page).to have_content("All Items")
    expect(page).to have_content(item.name)
    expect(page).to have_content(item2.name)
  end
end
