require 'rails_helper'

RSpec.describe "visitor can add item to cart" do
  xit "can view an item and an add to cart link is present" do
    Category.create(name: "Potions")
    item_1 = create(:item)

    visit items_path

    expect(page).to have_button("Add #{item_1.name} to Cart")
    click_on "Add #{item_1.name} to Cart"
    expect(current_path).to eq(items_path)
    expect(page).to have_content("You now have 1 #{item_1.name} in your cart!")
  end

  xit "can click view cart and items are present" do
    Category.create(name: "Potions")
    item_1 = create(:item)

    visit items_path
    click_on "Add #{item_1.name} to Cart"
    expect(current_path).to eq(items_path)

    click_on "Cart"
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Total")
    expect(page).to have_content(item_1.name)
  end

  xit "can increase quantity for specific item in the cart show" do
    Category.create(name: "Potions")
    item_1 = create(:item)

    visit items_path
    click_on "Add #{item_1.name} to Cart"

    click_on "Cart"
    expect(page).to have_content("1")
    click_button "+"
    expect(page).to have_content("2")
    click_button "+"
    expect(page).to have_content("3")
  end

  xit "can decrease quantity for specific item in the cart show" do
    Category.create(name: "Potions")
    item_1 = create(:item)

    visit items_path
    click_on "Add #{item_1.name} to Cart"

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

  it "can see total price" do
    category = Category.create(name: "Potions")
    item_1 = Item.create(name: "Red Potion", description: "Feeds the body", price: 5, category_id: category.id)
    item_2 = Item.create(name: "Blue Potion", description: "Feeds the body", price: 5, category_id: category.id)


    visit items_path
    click_on "Add #{item_1.name} to Cart"
    click_on "Add #{item_2.name} to Cart"

    click_on "Cart"
    expect(page).to have_content("10 Rupees")
    expect(page).to have_content("1")
  end

  it "can add a second item to cart" do

  end

  # find(".button_plus1").(:button).click
  # click_button "+"
  # expect(page).to have_content("2")
  # expect(page).to have_content("15 Rupees")
end
