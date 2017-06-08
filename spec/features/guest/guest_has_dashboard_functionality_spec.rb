require "rails_helper"

RSpec.describe "Guest can visit dashboard" do
  it "guest can click on stuff from dashboard" do
    visit root_path

    click_on "Items"
    expect(current_path).to eq('/items')

    click_on "Zelda's Little Shop"
    expect(current_path).to eq('/')

    click_on "Categories"
    expect(current_path).to eq('/categories')

    click_on "Zelda's Little Shop"

    click_on "Login"
    expect(current_path).to eq('/login')

    click_on "Zelda's Little Shop"

    click_on "Create Account"
    expect(current_path).to eq('/users/new')

  end
end
