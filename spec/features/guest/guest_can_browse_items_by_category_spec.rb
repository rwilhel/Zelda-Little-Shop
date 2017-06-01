require 'rails_helper'

RSpec.describe "guest can browse categories" do
  it "can see all categories" do
    Category.create(name: "Potions")
    Category.create(name: "Bombs")

    visit items_path
    click_on "Categories"

    expect(current_path).to eq("/categories")
    expect(page).to have_content("All Categories")
    expect(page).to have_content("Potions")
    expect(page).to have_content("Bombs")
  end

  it "can go to a specific category" do
    category = Category.create(name: "Potions")
    item1 = Item.create(name: "Red Potion", description: "Feeds the body", price: 2, category_id: 3)
    item2 = Item.create(name: "Blue Potion", description: "Feeds the body", price: 2, category_id: 3)

    visit categories_path
    click_on "Potions"

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Red Potion")
    expect(page).to have_content("Blue Potion")
  end
end
