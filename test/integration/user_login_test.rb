require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "a registered user can login" do
    user = User.create(username: "Chris", password: "password")

    visit login_path
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, Chris!")
  end
end
