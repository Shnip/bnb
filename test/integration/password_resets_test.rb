require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:one)
  end

  test "password reset" do
    #new action invalid inforamtion
    get new_password_reset_path
    assert_template 'password_resets/new'
    post password_resets_path, params: { password_reset: {email: ""}}
    assert_template 'password_resets/new'
    assert_not flash[:danger].empty?
    #new action valid inforamtion
    post password_resets_path, params: { password_reset: {email: @user.email}}
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_redirected_to root_url
    assert_not flash[:info].empty?
    #manual generate password_token
    @user.generate_reset_password_token!
    #edit action wrong token
    get edit_password_reset_url("wrong token")
    assert_template 'password_resets/new'
    assert_not flash[:danger].empty?
    #edit action right token
    get edit_password_reset_url(@user.reset_password_token)
    assert_template 'password_resets/edit'
    # Invalid password & confirmation
    patch password_reset_path(@user.reset_password_token),
         params: { user: { password:              "foobaz",
                           password_confirmation: "barquux" } }
    assert_template 'password_resets/edit'
    assert_select 'div#error_explanation'
    # Empty password and confirmation
    patch password_reset_path(@user.reset_password_token),
         params: { user: { password:              "",
                           password_confirmation: "" } }
    assert_template 'password_resets/edit'
    assert_select 'div#error_explanation'
    # Valid password & confirmation
    patch password_reset_path(@user.reset_password_token),
          params: { user: { password:              "foobaz",
                            password_confirmation: "foobaz" } }
    assert_redirected_to @user
    assert_not flash[:success].blank?
  end

end
