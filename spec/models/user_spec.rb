require 'rails_helper'

describe User do
  it {should validate_presence_of :user_name}
  it {should validate_presence_of :email}
  it {should have_many :photos}
  it {should have_many :comments}
  it {should have_many :tagged_users}
  it {should have_many(:photo_tagged).through(:tagged_users)}
  it {should have_many :favorites}
  it {should have_many(:photo_favorites).through(:favorites)}
end
