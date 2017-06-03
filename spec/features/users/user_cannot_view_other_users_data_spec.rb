require 'rails_helper'

RSpec.describe "user cannot see other users info" do
  it "when viewing orders page" do
    user = User.create(username: "Link", password: "password")
    maboy= User.create(username: "Lunk", password: "password")
    category = Category.create(name: "Potions")
    item = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    order1 = Order.create(user_id: user.id)
    order2 = Order.create(user_id: maboy.id)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Login'

    visit patron_user_path(user)

    expect(current_path).to eq("/patron/users/#{user.id}")
    expect(page).to have_content("#{user.username}")
    expect(page).to_not have_content("#{maboy.username}")

    click_on "Orders"
    expect(current_path).to eq("/patron/orders")
    expect(page).to have_content("Order: 1")
    expect(page).to_not have_content("Order: 2")
  end

  it "cannot view a different users orders" do
    user = User.create(username: "Lonk", password: "password")
    maboy= User.create(username: "Lank", password: "password")
    category = Category.create(name: "Potions")
    item = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    order1 = Order.create(user_id: user.id)
    order2 = Order.create(user_id: maboy.id)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Login'

    visit patron_user_path(maboy)
    save_and_open_page
    expect(current_path).to eq("/patron/users/#{maboy.id}")
    expect(page).to_not have_content("Lank")
  end
end
