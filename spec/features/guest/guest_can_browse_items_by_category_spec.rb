require 'rails_helper'

RSpec.describe "guest can browse categories" do
  it "can see all categories" do
    guest = create(:guest)

    visit guest_items_path
    click_on "Categories"

    expect(current_path).to eq("/guest/categories")
    expect(page).to have_content("All Categories")
    expect(page).to have_content("Potions")
    expect(page).to have_content("Bombs")
  end

  it "can go to a specific category" do
    guest = create(:guest)

    visit guest_categories_path
    click_on "Potions"

    expect(current_path).to eq("/guest/categories/potions")
    expect(page).to have_content("Red Potion")
    expect(page).to have_content("Blue Potion")
  end
end
