require 'rails_helper'

RSpec.describe Idea, type: :model do
  it {should belong_to(:category)}
  it {should belong_to(:user)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
end