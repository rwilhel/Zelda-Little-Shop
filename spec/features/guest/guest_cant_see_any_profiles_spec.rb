require 'rails_helper'

RSpec.describe "guest cannot view user accounts" do
  it "when visiting a patrons page guest is redirecected" do
    link = User.create(username: "Link", password: "password")
    lunk= User.create(username: "Lunk", password: "password")
    visit dashboard_path

    visit patron_user_path(link)

    expect(current_path).to eq("/dashboard")

    visit patron_user_path(lunk)

    expect(current_path).to eq("/dashboard")
  end
end
