require 'rails_helper'

RSpec.describe "guest can't check out" do
  it "displays a login or create account option" do
    Category.create(name: "Potions")
    item_1 = create(:item)

    visit items_path
    click_on "Add #{item_1.name} to Cart"

    click_on "Cart"

    expect(page).to_not have_link("Checkout")
    expect(page).to have_content("Login")
    expect(page).to have_content("Create Account")
  end

  it "cart persists after creating an account or logging in" do
    Category.create(name: "Potions")
    item_1 = create(:item)

    visit items_path
    click_on "Add #{item_1.name} to Cart"

    click_on "Cart"

    click_on "Create Account"

    fill_in "Username", with: "Link"
    fill_in "Password", with: "password"

    click_on "Cart"

    expect(page).to have_content("#{item_1.name}")
  end
end
