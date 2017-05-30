require 'rails_helper'

RSpec.feature 'Admin can create images' do
  context 'Category already exists' do
    scenario 'logged in admin visits admin category pages'
      admin = create(:admin)
      category = create(:category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


  end
end