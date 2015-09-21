require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "a registered user can login" do
    user = User.create(username: "Chris", password: "password")

    visit login_path
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_button "Login"
    
    assert page.has_content?("Logout")
    assert page.has_content?("Welcome, Chris!")
  end

  test "a user must enter a correct password to login" do
    user = User.create(username: "Chris", password: "password")

    visit login_path
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "passwod"
    click_button "Login"

    assert page.has_content?("Username or Password is Incorrect.")
  end

  test "a user must be registered to login" do
    visit login_path
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Username or Password is Incorrect.")
  end

end
