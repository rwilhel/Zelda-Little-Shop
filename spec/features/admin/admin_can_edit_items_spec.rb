require "rails_helper"

RSpec.describe "admin can edit items" do
  it "can see an edit button" do
    admin = create(:admin)
    category = Category.create!(name: "Potions")
    category2 = Category.create!(name: "Food")

    item = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)

    visit root_path

    click_on "Login"
    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq('/admin/dashboard')

    visit admin_items_path

    expect(current_path).to eq('/admin/items')
    expect(page).to have_content('Edit')

    click_on "Edit"

    fill_in "Price", with: ""
    fill_in "Price", with: 35
    select 'Food', from: 'item[category_id]'
    click_on "Update Item"

    expect(page).to have_content(35)
    expect(page).to have_content("You successfully updated #{item.name}.")

    visit categories_path
    click_on "Food"
    
    expect(page).to have_content("#{item.name}")
  end
end
