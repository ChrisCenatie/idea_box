require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "a visitor can create an account" do
    visit root_path
    assert_equal 200, page.status_code
    click_link "Create Account"
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_on "Create Account"

    assert_equal 200, page.status_code
    assert page.has_content?("Account Successfully Created")
  end

  test "a visitor must have a unique username" do
    User.create(username: "Chris", password: "12345")
    visit root_path
    assert_equal 200, page.status_code
    click_link "Create Account"
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_on "Create Account"

    assert_equal 200, page.status_code
    assert page.has_content?("Username is Invalid")
  end

  test "a visitor must enter a username" do
    visit root_path
    assert_equal 200, page.status_code
    click_link "Create Account"
    fill_in "Password", with: "password"
    click_on "Create Account"

    assert page.has_content?("Please Complete Required Fields")
  end

  test "a visitor must enter a password" do
    visit root_path
    assert_equal 200, page.status_code
    click_link "Create Account"
    fill_in "Username", with: "Chris"
    click_on "Create Account"

    assert page.has_content?("Please Complete Required Fields")
  end

end
