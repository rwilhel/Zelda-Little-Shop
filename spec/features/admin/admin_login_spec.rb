require 'rails_helper'
## Story 19: Admin logs in

# As an Admin
# When I log in
# Then I am redirected to "/admin/dashboard"

RSpec.feature 'Admin can login' do
  context "with valid login details" do
    scenario 'an admin can login' do
      admin = create(:admin)

      visit root_path

      click_on 'Login'
      fill_in 'Username', with: admin.username
      fill_in 'Password', with: 'password'
      click_button 'Login'

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Welcome, #{user.username}!")
      expect(page).to have_link("Logout", href: logout_path)
      expect(page).to_not have_link("Login")

    end

    scenario "an unregistered user visits the root path" do

      visit root_path

      click_on "Login"
      fill_in "Username", with: 'Link'
      fill_in "Password", with: 'password'
      click_button "Login"


      expect(page).to have_content("U gun dun goofed")
      expect(page).to_not have_content("Welcome, Link!")
    end
  end

  context 'with invalid login details' do
    scenario 'a registered user visits root path' do
      user = User.create(username: 'Link', password: 'password')

      visit root_path

      click_on 'Login'
      fill_in 'Username', with: user.username
      fill_in 'Password', with: 'incorrect'
      click_button 'Login'

      expect(page).to have_content("U gun dun goofed")
      expect(current_path).to eq('/login')
    end
  end
end
