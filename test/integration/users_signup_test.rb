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
      post users_path, params: {user: { first_name: "Petr",
                                        last_name: "Petrov",
                                        email: "petr@example.com",
                                        password: "password",
                                        password_confirmation: "password" }}
    end
    follow_redirect!
    assert_not flash[:success].blank?
  end
end
