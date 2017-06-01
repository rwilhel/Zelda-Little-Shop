require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password)}
  it {should validate_uniqueness_of(:username)}
  it {should have_db_column(:role).with_options(default: 'patron')}
end

RSpec.describe User do
  it 'can be created as admin ' do
    user = create(:admin)

    expect(user.role).to eq('admin')
    expect(user.admin?).to  be_truthy
  end

  it 'can be created as a default user' do
    user = create(:user)
    expect(user.role).to eq('patron')
    expect(user.patron?).to be_truthy
  end

end
