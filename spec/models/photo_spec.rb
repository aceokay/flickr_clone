require 'rails_helper'

describe Photo do
  it {should belong_to :user}
  it {should have_and_belong_to_many :tags}
  it {should have_many :favorites}
  it {should have_many(:user_favorites).through(:favorites)}
  it {should have_many :tagged_users}
  it {should have_many(:user_tagged).through(:tagged_users)}
end
