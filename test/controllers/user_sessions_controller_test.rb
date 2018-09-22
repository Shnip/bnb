require 'test_helper'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should get logout" do
    login_user(users(:one))
    post logout_path
    assert_redirected_to root_path
  end
end
