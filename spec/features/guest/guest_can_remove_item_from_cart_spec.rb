require 'rails_helper'

RSpec.describe "guest can remove item from cart" do
  it "removes item from cart" do
    guest = create(:guest)
    item = Item.create(name: "Red Potion")
    Order.create(status: "Active", user_id: 1)
    session[:cart]["1"] = 1

    visit cart_path

    expect(page).to have_content("Red Potion")
    click_on "Remove"
    expect(page).to_not have_content("Red Potion")
    expect(page).to have_content("Succesfully Removed #{item.name} from cart")
    #will need to ensure the flash message is a link to that item
  end
end
