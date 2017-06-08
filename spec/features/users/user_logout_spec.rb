require 'rails_helper'

RSpec.feature 'User can logout' do
  scenario 'logged in user can logout' do
    user = User.create!(username: "Linksssssssssss", password: "password")

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_on 'Login'
    
    click_on "Logout"

    expect(current_path).to eq('/login')

  end
end
