FactoryGirl.define do
  factory :user do
    user_name "Cheese"
    email "cheese@cheese.com"
    password "cheesecheese"
  end

  factory :no_admin_user, class: User do
    user_name "Test"
    email "test@test.com"
    password "testtest"
    admin false
  end
end
