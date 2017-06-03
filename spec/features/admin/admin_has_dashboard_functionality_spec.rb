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

end
