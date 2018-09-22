require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  # VALIDATIONS

  test "should be valid" do
    assert @user.valid?
  end

  test "first_name should be present" do
    @user.first_name = " "
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "first_name should not be too long" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 201 + "@example.com"
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    assert_not duplicate_user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a"*3
    assert_not @user.valid?
  end
end
