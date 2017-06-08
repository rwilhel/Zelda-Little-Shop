require 'rails_helper'

RSpec.describe "guest can't check out" do
  it "displays a login or create account option" do
    category = Category.create(name: "Potions")
    item_1 = Item.create(name: "Milk", description: "Feeds the body", price: 2, category_id: category.id)

    visit items_path
    click_on "Add #{item_1.name} to Cart"

    click_on "Cart"


    expect(page).to have_content("Login")
    expect(page).to have_content("Create Account to Checkout")
  end

  it "cart persists after creating an account or logging in" do
    category = Category.create(name: "Potions")
    item_1 = Item.create(name: "Milk", description: "Feeds the body", price: 2, category_id: category.id)

    visit items_path

    click_on "Add #{item_1.name} to Cart"

    click_on "Cart"

    click_on "Create Account"

    fill_in "Username", with: "Link"
    fill_in "Password", with: "password"
    click_on "Create Account"
    click_on "Cart"

    expect(page).to have_content("#{item_1.name}")
    expect(page).to have_content("Checkout")
  end
end
