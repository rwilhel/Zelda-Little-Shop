require 'rails_helper'

RSpec.describe "When an authenticated user visits a retired item's page" do
  it "can view the retired item" do
    user = User.create(username: "Link", password: "passsword")
    category = Category.create(name: "Potions")
    item1 = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    item2 = Item.create!(name: "Blue Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id,
                  status: false)
    item3 = Item.create!(name: "Purple Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: "#{user.username}"
    fill_in 'Password', with: 'passsword'
    click_on 'Login'

    visit items_path

    click_on "Blue Potion"
    expect(current_path).to eq("/items/#{item2.id}")
    expect(page).to_not have_content("Add to Cart")
    expect(page).to have_content("Active? false")
  end

  it "can not view the Add to Cart for a retired item" do
    user = User.create(username: "Link", password: "passsword")
    category = Category.create(name: "Potions")
    item1 = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    item2 = Item.create!(name: "Blue Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id,
                  status: false)
    item3 = Item.create!(name: "Purple Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: "#{user.username}"
    fill_in 'Password', with: 'passsword'
    click_on 'Login'

    visit items_path

    expect(page).to_not have_content("Add #{item2.name} to Cart")
  end
end
