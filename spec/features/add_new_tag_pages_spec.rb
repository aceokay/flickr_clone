require 'rails_helper'

describe "User sign-up and login path" do
  it "it allows an admin to delete another user" do
    tag = FactoryGirl.create(:tag)
    admin = FactoryGirl.create(:user)
    visit '/'
    click_on "Login"
    fill_in 'Email', :with => admin.email
    fill_in 'Password', :with => admin.password
    click_button 'Log in'
    click_on admin.user_name
    click_on "Add New Tag"
    fill_in 'Name', :with => tag.name
    click_button 'Create Tag'
    expect(page).to have_content tag.name
  end
end
