require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @unactivated_user = users(:two)
    @activated_user = users(:one)
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

  test "login with valid information with no activation" do
    get login_path
    assert_template 'user_sessions/new'
    post user_sessions_path, params: { user_session: {  email: @unactivated_user.email,
                                                        password: "password",
                                                        remember_me: "0"}}
    assert_redirected_to root_url
    assert_not flash[:danger].blank?
  end

  test "login with valid information with activation" do
    get login_path
    assert_template 'user_sessions/new'
    post user_sessions_path, params: { user_session: {  email: @activated_user.email,
                                                        password: "password",
                                                        remember_me: "0"}}
    assert_redirected_to @activated_user
    assert_not flash[:success].blank?
  end
end
