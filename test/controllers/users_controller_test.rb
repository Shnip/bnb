require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.password = "password"
    @user.password_confirmation = "password"
  end

  #WHEN NOT LOGGED IN

  test "should not get index when not logged in" do
    get users_url
    assert_redirected_to login_url
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: "example@example.com", first_name: "petr", last_name: "petrov", password: "password", password_confirmation: "password" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should not show user when not logged in" do
    get user_url(@user)
    assert_redirected_to login_url
  end

  test "should not get edit when not logged in" do
    get edit_user_url(@user)
    assert_redirected_to login_url
  end

  test "should not update user when not logged in" do
    patch user_url(@user), params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name } }
    assert_redirected_to login_url
  end

  test "should not destroy user when not logged in" do
    assert_no_difference('User.count') do
      delete user_url(@user)
    end

    assert_redirected_to login_url
  end

  # WHEN LOGGED IN

  test "should show user when logged in" do
    login_user(@user)
    get user_url(user = @user)
    assert_response :success
  end
  #
  test "should get edit when logged in" do
    login_user(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user when logged in" do
    login_user(@user)
    patch user_url(@user), params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name } }
    assert_redirected_to @user
  end

  test "should destroy user when logged in" do
    login_user(@user)
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
