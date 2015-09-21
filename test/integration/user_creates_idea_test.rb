require 'test_helper'

class UserCreatesIdeaTest < ActionDispatch::IntegrationTest

  test "a user can create an idea" do
    user = User.create(username: "Chris", password: "password")
    Category.create(category: "Test1")
    id = Category.first.id

    visit login_path
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_button "Login"
    click_link "Create Idea >>"

    fill_in "Idea", with: "Idea 1"
    find("option[value='#{id}']").click
    click_button "Submit Idea"
    assert page.has_content?("Idea 1")
  end
end
