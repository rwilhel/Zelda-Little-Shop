require 'rails_helper'

RSpec.describe "Admin views an individual order" do
  it "admin can view an individual order" do
    admin = create(:admin)
    category = Category.create(name: "Potions")
    item = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    order1 = Order.create(user_id: admin.id)
    orderitem = OrdersItem.create(order_id: order1.id,
                                    item_id: item.id,
                                    quantity: 2342334)

    visit root_path

    click_on "Login"
    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq('/admin/dashboard')

    click_on "Account"
    click_on "All Orders"
    expect(page).to have_content("Order: #{order1.id}")
    expect(page).to have_content("Complete")
    expect(page).to have_content("Delete")

    click_on "#{order1.id}"
    expect(page).to have_content("Order Date")
    expect(page).to have_content("#{item.name}")
  end
end
