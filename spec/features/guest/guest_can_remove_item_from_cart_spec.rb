require 'rails_helper'

RSpec.describe "guest can remove item from cart" do
  it "removes item from cart" do
    category = Category.create(name: "Potions")
    item = Item.create(name: "Red Potion", description: "Revitalizes old faculties", category_id: category.id, price: 5)
    visit items_path
    click_on "Add #{item.name} to Cart"

    click_on "Cart"

    expect(page).to have_content("Red Potion")
    click_on "Remove"
    expect(page).to have_content("Succesfully Removed #{item.name} from cart")
    expect(page).to_not have_content("5")
    #will need to ensure the flash message is a link to that item
  end
end
