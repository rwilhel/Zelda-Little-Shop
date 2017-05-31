require 'rails_helper'

RSpec.feature 'registered user can login' do
  context "with valid login details" do
    scenario 'a registered user can login' do
      user = User.create!(username: 'Link', password: 'password')

      visit root_path

      click_on 'Login'
      fill_in 'Username', with: user.username
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
