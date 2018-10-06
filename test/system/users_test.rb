require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # def setup
  #   @user = users(:one)
  # end
  #
  # # test "visiting the index" do
  # # =>login_user(@user)
  # #   visit users_url
  # #   assert_selector "h1", text: "Users"
  # # end
  #
  # test "creating a User" do
  #   visit root_path
  #   click_on "Sign Up"
  #
  #   fill_in "Crypted Password", with: @user.crypted_password
  #   fill_in "Email", with: @user.email
  #   fill_in "First Name", with: @user.first_name
  #   fill_in "Last Name", with: @user.last_name
  #   fill_in "Salt", with: @user.salt
  #   click_on "Create my account"
  #
  #   assert_text "User was successfully created"
  #   click_on "Back"
  # end
  #
  # test "updating a User" do
  #   visit users_url
  #   click_on "Edit", match: :first
  #
  #   fill_in "Crypted Password", with: @user.crypted_password
  #   fill_in "Email", with: @user.email
  #   fill_in "First Name", with: @user.first_name
  #   fill_in "Last Name", with: @user.last_name
  #   fill_in "Salt", with: @user.salt
  #   click_on "Update User"
  #
  #   assert_text "User was successfully updated"
  #   click_on "Back"
  # end
  #
  # test "destroying a User" do
  #   visit users_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end
  #
  #   assert_text "User was successfully destroyed"
  # end
end
