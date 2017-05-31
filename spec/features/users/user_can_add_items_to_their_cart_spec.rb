require 'rails_helper'

RSpec.feature "When a user adds items to their backpack" do
  before(:each) do
    Item.create!(
      title: "Red Potion",
      description: "Healing Potion",
      price: 15)
  end

  # scenario "a message is displayed" do
  #   visit root_path
  #   click_button "Add Item"
  #
  #   expect(page).to have_content("You now have 1 Rollerball Pen.")
  # end
  # #
  # scenario "the message correctly increments for multiple items" do
  #   visit root_path
  #   click_button "Add Item"
  #   expect(page).to have_content("You now have 1 Rollerball Pen.")
  #   click_button "Add Item"
  #
  #   expect(page).to have_content("You now have 2 Rollerball Pens.")
  # end
  #
  # scenario "the total number of items in the backpack increments" do
  #   visit root_path
  #   expect(page).to have_content("Backpack: 0")
  #   click_button "Add Item"
  #
  #   expect(page).to have_content("Backpack: 1")
  end
end
