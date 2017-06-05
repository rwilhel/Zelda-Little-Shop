require "rails_helper"

RSpec.describe "registered user can edit profile" do
  it "can edit information" do
    user = create(:user)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: "#{user.username}"
    fill_in 'Password', with: 'password'
    click_on 'Login'

    click_on "Account"

    click_on "Edit Profile"


    fill_in "Username", with: "Ben"
    fill_in "Password", with: "something"
    click_on "Update User"

    expect(page).to have_content("Ben")
    click_on "Logout"

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: "Ben"
    fill_in 'Password', with: 'something'
    click_on 'Login'

    expect(current_path).to eq('/dashboard')
  end
end
