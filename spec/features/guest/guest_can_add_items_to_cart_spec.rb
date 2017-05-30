require 'rails_helper'

RSpec.describe "visitor can add item to cart" do
  it "can view an item and an add to cart link is present" do
    guest = create(:guest)

    visit guest_items_path

    click_on "Add to Cart"
    expect(current_path).to eq("/guest/items")
  end

  it "can click view cart and items are present" do
    guest = create(:guest)

    visit guest_items_path
    click_on "Add to Cart"

    click_on "Cart"
    expect(current_path).to eq("/cart")
    expect(page).to have_content("Description")
    expect(page).to have_content("Price")
    expect(page).to have_content("Total")
  end
end
