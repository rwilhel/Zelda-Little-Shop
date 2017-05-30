require 'rails_helper'
require 'login_helper'

RSpec.feature 'user can edit their account' do
  context 'they supply valid information' do
    scenario  'logged in user visits the root path' do
      user = create(:user)
      previous_name = user.username

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on 'Account'
      expect(current_path).to eq(user_path(user))

      click_on 'Edit Profile'
      expect(current_path).to eq(edit_user_path(user))

      fill_in 'Username', with: 'Chantal Justamond'
      click_button 'Update User'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content('Profile updated successfully')
      expect(page).to have_content('Welcome, Chantal Justamond!')
      expect(page).not_to have_content("Welcome, #{previous_name}!")
    end
  end

  context 'user supply invalid information' do
    scenario  'logged in user visits page to edit their profile' do
      skip
      user_login
      another_user = create(:user)

      visit edit_user_path(User.first)
      fill_in 'Username', with: another_user.username
      fill_in 'Password', with: 'incorrect'
      click_button 'Update User'

      expect(page).to have_content('Username has already been taken')
      expect(page).to have_content("Welcome, #{User.first.username}!")
      expect(page).not_to have_content("Welcome, #{another_user.username}!")
    end
  end
end
