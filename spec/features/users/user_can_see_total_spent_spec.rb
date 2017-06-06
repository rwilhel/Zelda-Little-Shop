require "rails_helper"

RSpec.describe "user sees total spent on profile page" do
  it "user sees total spent after navigating to profile page" do
    user = User.create!(username: "Link", password: "password")
    category = Category.create!(name: "Potions")
      item1 = Item.create!(name: "Red Potion", description: "Feeds the body", price: 2, category_id: category.id)
      item2 = Item.create!(name: "Blue Potion", description: "Feeds the body", price: 2, category_id: category.id)
      item3 = Item.create!(name: "Yellow Potion", description: "Feeds the body", price: 2, category_id: category.id)

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

      click_on "Items"

      click_on "Add #{item1.name} to Cart"
      click_on "Add #{item1.name} to Cart"
      click_on "Add #{item2.name} to Cart"
      click_on "Add #{item3.name} to Cart"

      click_on 'Cart'

      expect(page).to have_content(8)
      click_on 'Checkout'

      click_on "Account"

  end
end
