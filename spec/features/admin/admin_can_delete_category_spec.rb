require 'rails_helper'

RSpec.feature 'Admin can delete a category' do
  scenario "logged_in admin visits an individual category's page" do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category = create(:category)

    visit admin_category_path(category)

    click_on 'Delete Category'

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("#{category.name} successfully deleted")
    expect(page).not_to have_link(category.name, href: admin_category_path(category))
  end
end