require 'rails_helper'

describe 'Users can be created' do
  describe 'a user can be created' do
    it 'a user can be created' do
      visit root_path

      click_on 'Create Account'

      expect(current_path).to eq(new_user_path)

      fill_in 'Username', with: 'chantal'
      fill_in 'Email', with: 'chantal@example.com'
      fill_in 'Password', with: 'password'

      click_button 'Create User'

      expect(current_path).to eq("/users/#{User.last.id}/ideas")
      expect(page).to have_content("Account created successfully!")
      expect(page).to have_content("Welcome, chantal!")
      expect(page).to have_link("Logout", href: logout_path)
      expect(page).not_to have_link("Login", href: login_path)
      expect(page).not_to have_link("Create Account", href: new_user_path)
    end
  end

  context 'With invalid username and/or email' do
    scenario "A guest visits the root path" do
      user = create(:user)

      visit root_path

      click_on "Create Account"
      fill_in "Username", with: user.username
      fill_in "Email", with: 'chantal@example.com'
      fill_in "Password", with: 'password'
      click_button "Create User"

      expect(page).to have_content("Username has already been taken")
    end
  end
end