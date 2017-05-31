require 'rails_helper'

describe ' can be created' do
  describe 'a user can be created' do
    it 'a user can be created' do

      visit root_path

      click_on 'Create Account'

      expect(current_path).to eq(new_user_path)

      fill_in 'Username', with: "Link the character from Zelda, who is the hero of time. Wielder of the triforce of Courage, slayer of Ganon. Champion of Hyrule and Hylia. Pure G."
      fill_in 'Password', with: 'password'

      click_button 'Create Account'

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Account created successfully!")
      expect(page).to have_content("Link the character from Zelda, who is the hero of time. Wielder of the triforce of Courage, slayer of Ganon. Champion of Hyrule and Hylia. Pure G.")
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
      fill_in "Password", with: 'password'
      click_button "Create Account"

      expect(page).to have_content("U gun dun goofed")
    end
  end
 end
