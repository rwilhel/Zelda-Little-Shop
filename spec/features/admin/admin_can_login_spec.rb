require 'rails_helper'

RSpec.feature 'admin can login' do
  context "with valid login details" do
    scenario 'an admin can user can login' do
      admin = create(:admin)

      visit root_path

      click_on 'Login'
      fill_in 'Username', with: admin.username
      fill_in 'Password', with: 'password'
      click_button 'Login'

      expect(current_path).to eq("/admin/dashboard")
      expect(page).to have_content("Welcome, #{admin.username}!")
      expect(page).to have_link("Logout", href: logout_path)
      expect(page).to_not have_link("Login")

    end
  end

  context 'with invalid login details' do
    scenario 'an admin visits root path' do
      admin = create(:admin)

      visit root_path

      click_on 'Login'
      fill_in 'Username', with: admin.username
      fill_in 'Password', with: 'incorrect'
      click_button 'Login'

      expect(page).to have_content("U gun dun goofed")
      expect(current_path).to eq('/login')
    end
  end
end
