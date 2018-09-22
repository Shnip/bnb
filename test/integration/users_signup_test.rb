require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "register with invalid information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: {user: { first_name: "Ivan",
                                        last_name: "Ivanov",
                                        email: "ivan@example.com",
                                        password: "",
                                        password_confirmation: "" }}
    end
    assert_template "users/new"
  end

  test "register with existing email" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: {user: { first_name: "Ivan",
                                        last_name: "Ivanov",
                                        email: "ivan@example.com",
                                        password: "password",
                                        password_confirmation: "password" }}
    end
    assert_template "users/new"
  end

  test "register with valid information" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: {user: { first_name: "Alex",
                                        last_name: "Alex",
                                        email: "alex@example.com",
                                        password: "password",
                                        password_confirmation: "password" }}
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_redirected_to root_path
    follow_redirect!
    assert_not flash[:info].blank?
    assert_not user.activated?

    login_user(user)
    assert_template 'static_pages/home'
    assert_not flash[:danger].blank?

    get edit_account_activation_path("wrong token", email: user.email)
    assert_not user.reload.activated?

    get edit_account_activation_path(user.activation_token, email: "wrong email")
    assert_not user.reload.activated?

    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
  end
end
