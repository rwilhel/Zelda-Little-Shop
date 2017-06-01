require 'rails_helper'


## Story 12: Viewing past orders

# Background: An existing user that has multiple orders
#
# As an Authenticated User
# When I visit "/orders"
# Then I should see all orders belonging to me and no other orders

RSpec.describe 'as a logged in user can checkout' do
  it 'user can checkout an order' do
    user = create(:user)
    category = Category.create(name: "Potions")
    item1 = Item.create(name: "Red Potion", description: "Feeds the body", price: 2, category_id: category.id)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: "#{user.username}"
    fill_in 'Password', with: 'password'

    visit items_path

    click_on "Add #{item1.name} to Cart"


    click_on 'Cart'
    click_on 'Checkout'

    expect(user.role?).to eq('patron')
    expect(current_path).to eq('/orders')
    expect(page).to have_content('Checkout')
    expect(page).to have_content('Order was successfully placed')
  end
end