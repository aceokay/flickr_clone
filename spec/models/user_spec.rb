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

  it "will make a user admin if it's the first or second one" do
    user = FactoryGirl.create(:user)
    expect(user.admin).to eq true
  end

  it "will make a user an admin" do
    user = FactoryGirl.create(:no_admin_user)
    user.make_user_admin
    expect(user.admin).to eq true
  end

  it "will take away adminship" do
    user = FactoryGirl.create(:user)
    user.remove_admin
    expect(user.admin).to eq false
  end
end
