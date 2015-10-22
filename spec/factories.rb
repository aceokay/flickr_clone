FactoryGirl.define do
  factory :user do
    user_name "Cheese"
    sequence :email do |n|
      (n + rand(100000)).to_s + "@examplecheese.com"
    end
    password "cheesecheese"
    admin true
  end

  factory :no_admin_user, class: User do
    user_name "Test"
    email "test@test.com"
    password "testtest"
    admin false
  end
end
