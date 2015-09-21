require 'test_helper'

class UserCategoryTest < ActionDispatch::IntegrationTest
  test "an admin-user can see a list of categories" do
    user = User.create(username: "Chris", password: "password", admin: true)
    category1 = Category.create(category: "Test1")
    category2 = Category.create(category: "Test2")

    visit login_path
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_button "Login"

    within(".categories") do
      assert page.has_content?("Test1")
      assert page.has_content?("Test2")
    end
  end

  test "an admin-user can add a new category" do
    user = User.create(username: "Chris", password: "password", admin: true)

    visit login_path
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_button "Login"

    click_link "Create New Category"
    fill_in "Category", with: "New Category"
    click_button "Create Category"

    within(".categories") do
      assert page.has_content?("New Category")
    end
  end

  test "an admin-user can delete a category" do
    user = User.create(username: "Chris", password: "password", admin: true)
    Category.create(category: "Test1")

    visit login_path
    fill_in "Username", with: "Chris"
    fill_in "Password", with: "password"
    click_button "Login"

    within(".categories") do
      assert page.has_content?("Test1")
      click_link "Delete Category"
    end
    refute page.has_content?("Test1")
  end

  test "a regular-user can not add a new category" do
    user = User.create(username: "Bob", password: "password")

    visit login_path
    fill_in "Username", with: "Bob"
    fill_in "Password", with: "password"
    click_button "Login"

    refute page.has_content?"Create New Category"
  end

  test "a regular-user can not delete a category" do
    user = User.create(username: "Bob", password: "password")
    Category.create(category: "Test1")

    visit login_path
    fill_in "Username", with: "Bob"
    fill_in "Password", with: "password"
    click_button "Login"

    within(".categories") do
      assert page.has_content?("Test1")
      refute page.has_content?("Delete Category")
    end
  end

end
