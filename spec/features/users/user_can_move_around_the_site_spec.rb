require "rails_helper"

RSpec.describe "User can move everywhere they should be a" do
  it "it has full user life cycle" do
    user = User.create!(username: "Linkss", password: "password")
    category = Category.create!(name: "Potions")
    item1 = Item.create!(name: "Red Potion", description: "Feeds the body", price: 2, category_id: category.id)
    item2 = Item.create!(name: "Blue Potion", description: "Feeds the body", price: 2, category_id: category.id)
    item3 = Item.create!(name: "Yellow Potion", description: "Feeds the body", price: 2, category_id: category.id)
    order1 = Order.create(user_id: user.id)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: "#{user.username}"
    fill_in 'Password', with: 'password'
    click_on 'Login'

    click_on "Items"

    click_on "Add #{item1.name} to Cart"
    click_on "Add #{item1.name} to Cart"
    click_on "Add #{item2.name} to Cart"
    click_on "Add #{item3.name} to Cart"


    click_on 'Cart'
    click_on 'Checkout'

    expect(user.role).to eq('patron')
    expect(user.patron?).to eq(true)
    expect(current_path).to eq('/patron/orders')
    expect(page).to have_content('Order was successfully placed')
    
    expect(current_path).to eq('/patron/orders')
    expect(page).to have_content("Order: #{order1.id}")

    visit items_path
    expect(current_path).to eq('/items')

    click_on "Cart"
    expect(page).to_not have_content("#{item1.name}")
  end
end
