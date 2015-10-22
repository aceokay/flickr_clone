require 'rails_helper'

describe "User sign-up and login path" do
  user = FactoryGirl.create(:user)
  it "adds a user and logs them in" do
    visit '/'
    click_on "Sign up"
    fill_in 'Email', :with =>"test@test.com"
    fill_in 'User name', :with => "test"
    fill_in 'Password', :with => "testtest"
    fill_in 'Password confirmation', :with => "testtest"
    click_button 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "it allows a user to signin and view their profile page" do
    visit '/'
    click_on "Login"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    click_on user.user_name
    expect(page).to have_content "Admin Privileges"
  end
end
