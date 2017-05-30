require 'rails_helper'

describe 'User create a new idea' do
  scenario 'a user can create a new idea' do
    user = create(:user)
    admin = create(:admin)
    category = create(:category)

    visit root_path

    click_on 'Login'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Login'

    click_on 'New Idea'

    expect(current_path).to eq(new_user_idea_path(user))
    fill_in 'idea[title]', with: 'Weather App'
    fill_in 'idea[description]', with: 'Some awesome description goes here'
    select category.name , :from => 'idea[category_id]'
    click_button 'Create Idea'
    # binding.pry
    expect(current_path).to eq("/users/#{user.id}/ideas/#{Idea.last.id}")
    expect(page).to have_content('Weather App')
    expect(page).to have_content('Some awesome description goes here')
  end
end