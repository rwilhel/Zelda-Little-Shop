require "rails_helper"

RSpec.describe "Admin can create items" do
  it "can add item" do
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
    click_on 'Account'

    click_on "Create Item"

    fill_in "Name", with: "Yellow Potion"
    fill_in "Description", with: "It does stuff"
    fill_in "Price", with: 24
    select 'Potions', from: 'Category'
    click_on "Submit"

    expect(page).to have_content("You successfully created Yellow Potion")

    visit items_path

    expect(page).to have_content("Yellow Potion")

  end

  
end
