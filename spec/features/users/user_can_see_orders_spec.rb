require "rails_helper"

# ## Story 12: Viewing past orders
#
# Background: An existing user that has multiple orders
#
# As an Authenticated User
# When I visit "/orders"
# Then I should see all orders belonging to me and no other orders

RSpec.describe "user can see past, present and future orders" do
  it "can see into the past" do
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

    visit 'patron/orders'
    expect(current_path).to eq('/patron/orders')
    expect(page).to have_content("Order: #{order1.id}")

  end

  it "can see all orders" do
    user = User.create(username: "Link", password: "passsword")
    category = Category.create(name: "Potions")
    item = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    order1 = Order.create(user_id: user.id)
    order2 = Order.create(user_id: user.id)
    order3 = Order.create(user_id: user.id)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: "#{user.username}"
    fill_in 'Password', with: 'passsword'
    click_on 'Login'

    visit '/patron/orders'
    expect(page).to have_content("Order: #{order1.id}")
    expect(page).to have_content("Order: #{order2.id}")
    expect(page).to have_content("Order: #{order3.id}")
  end

  it "can see an individual order" do
    user = User.create(username: "Link", password: "passsword")
    category = Category.create(name: "Potions")
    item1 = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    item2 = Item.create!(name: "Blue Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    item3 = Item.create!(name: "Purple Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    order1 = Order.create(user_id: user.id)
    OrdersItem.create(item_id: item1.id, order_id: order1.id, quantity: 4)
    OrdersItem.create(item_id: item2.id, order_id: order1.id, quantity: 2)
    OrdersItem.create(item_id: item3.id, order_id: order1.id, quantity: 1)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: "#{user.username}"
    fill_in 'Password', with: 'passsword'
    click_on 'Login'

    visit '/patron/orders'

    click_on "Order: #{order1.id}"

    expect(current_path).to eq("/patron/orders/#{order1.id}")
    expect(page).to have_content("Total: 70")
    expect(page).to have_content("Red Potion")
    expect(page).to have_content("Blue Potion")
    expect(page).to have_content("Purple Potion")
    expect(page).to have_content("40")
    expect(page).to have_content("20")
    expect(page).to have_content("10")
    expect(page).to have_content("Order Date")
    expect(page).to have_content("Ordered")
  end
end
