require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "a registered user can login" do
    user = User.create(username: "Chris", password: "password")

    visit login_path
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_button "Login"
    click_link "Logout"
    
    refute page.has_content?("Welcome, Chris!")
  end
end
