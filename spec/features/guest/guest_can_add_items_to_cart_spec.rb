require 'rails_helper'

RSpec.describe "visitor can add item to cart" do
  it "can view an item and an add to cart link is present" do
    Category.create(name: "Potions")
    item = create(:item)

    visit items_path

    expect(page).to have_button("Add to Cart")
    click_on "Add to Cart"
    expect(current_path).to eq(items_path)
    expect(page).to have_content("You now have 1 #{item.name} in your cart!")
  end

  it "can click view cart and items are present" do
    Category.create(name: "Potions")
    item = create(:item)

    visit items_path
    click_on "Add to Cart"
    expect(current_path).to eq(items_path)

    click_on "Cart"
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Total")
    expect(page).to have_content(item.name)
  end

  it "can increase quantity for specific item in the cart show" do
    Category.create(name: "Potions")
    item = create(:item)

    visit items_path
    click_on "Add to Cart"

    click_on "Cart"
    expect(page).to have_content("1")
    click_button "+"
    expect(page).to have_content("2")
    click_button "+"
    expect(page).to have_content("3")
  end

  it "can decrease quantity for specific item in the cart show" do
    Category.create(name: "Potions")
    item = create(:item)

    visit items_path
    click_on "Add to Cart"

    click_on "Cart"
    expect(page).to have_content("1")
    click_button "+"
    expect(page).to have_content("2")
    click_button "+"
    expect(page).to have_content("3")
    click_button "-"
    expect(page).to have_content("2")
    click_button "-"
    expect(page).to have_content("1")
  end
end
