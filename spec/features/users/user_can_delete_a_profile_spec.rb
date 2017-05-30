require 'rails_helper'
require 'login_helper'

RSpec.feature 'user can delete their profile' do
  scenario 'logged in user can delete its profile' do
    user_login

    visit user_path(User.first)
    click_on 'Delete Profile'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Profile deleted succesfully')
    expect(page).not_to have_content('Welcome, Chantal!')

    click_on 'Login'
    fill_in "Username", with: "chantal"
    fill_in "Password", with: 'password'
    click_button "Login"

    expect(page).to have_content("Username or password incorrect")
  end
end