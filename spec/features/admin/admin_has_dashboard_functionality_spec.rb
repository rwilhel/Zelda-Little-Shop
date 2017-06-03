require 'rails_helper'

RSpec.describe "only an admin can visit admin/dashboard" do
  it "can see the admin/dashboard page" do
    admin = create(:admin)

    visit root_path

    click_on "Login"
    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq('/admin/dashboard')
    expect(page).to have_content("Welcome, #{admin.username}!")
  end

  it "an admin can view their account page" do
    admin = create(:admin)

    visit root_path

    click_on "Login"
    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq('/admin/dashboard')

    click_on "Account"
    expect(current_path).to eq(admin_user_path(admin))
    expect(page).to have_link("All Orders")
    expect(page).to have_link("All Items")
    expect(page).to have_link("Create Items")
  end

  it "admin can view and delete orders" do
    admin = create(:admin)
    category = Category.create(name: "Potions")
    item = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    order1 = Order.create(user_id: admin.id)

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

    click_on "Delete"
    expect(page).to_not have_content("Order: #{order1.id}")
  end

  it "admin can view and edit all orders" do
    admin = create(:admin)
    category = Category.create(name: "Potions")
    item = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    order1 = Order.create(user_id: admin.id)

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

    click_on "Complete"
    expect(page).to have_content("Completed")
  end
end
