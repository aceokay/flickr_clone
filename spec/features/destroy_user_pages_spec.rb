require 'rails_helper'

describe "User sign-up and login path" do

  it "it allows an admin to delete another user" do
    user = FactoryGirl.create(:no_admin_user)
    admin = FactoryGirl.create(:user)
    visit '/'
    click_on "Login"
    fill_in 'Email', :with => admin.email
    fill_in 'Password', :with => admin.password
    click_button 'Log in'
    # save_and_open_page
    click_on admin.user_name
    click_link('user-delete', match: :first)
    expect(page).not_to have_content user.user_name
  end
end
