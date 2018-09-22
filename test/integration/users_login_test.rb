require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'user_sessions/new'
    post user_sessions_path, params: { user_session: {  email: "",
                                                        password: "",
                                                        remember_me: "0"}}
    assert_template 'user_sessions/new'
    assert_not flash[:danger].blank?
  end

  test "login with valid information" do
    get login_path
    assert_template 'user_sessions/new'
    post user_sessions_path, params: { user_session: {  email: @user.email,
                                                        password: "password",
                                                        remember_me: "0"}}
    assert_redirected_to users_path
    assert_not flash[:success].blank?
  end
end
