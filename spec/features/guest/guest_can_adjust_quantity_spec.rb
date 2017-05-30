require 'rails_helper'

RSpec.describe "guest can adjust quantity" do
  it "can increase quantity" do
    guest = create(:guest)
    item = Item.create(name: "Red Potion")
    Order.create(status: "Active", user_id: 1)
    session[:cart]["1"] = 1

    visit cart_path

    click_on "+"
    expect(page).to have_content("2")
  end

  it "can decrease quantity" do
    guest = create(:guest)
    item = Item.create(name: "Red Potion")
    Order.create(status: "Active", user_id: 1)
    session[:cart]["1"] = 2

    visit cart_path

    click_on "-"
    expect(page).to have_content("1")
  end
end
