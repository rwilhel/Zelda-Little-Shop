require 'rails_helper'

RSpec.describe "guest can view index page" do
  it "displays all existing items" do
    guest = create(:guest)

    visit guest_items_path
    expect(page).to have_content("All Items")
    expect(page).to have_content("Red Potion")
    expect(page).to have_content("Wooden Sword")
  end
end
