require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = users(:one)
  end

  test "password_reset" do
    @user.generate_reset_password_token!
    mail = UserMailer.reset_password_email(@user)
    assert_equal "Your password has been reset", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match @user.email, mail.body.encoded
  end

  # test "account_activation" do
  #   @user.activation_token = SecureRandom.urlsafe_base64
  #   mail = UserMailer.account_activation(@user)
  #   assert_equal "Account activation", mail.subject
  #   assert_equal [@user.email], mail.to
  #   assert_equal ["from@example.com"], mail.from
  #   assert_match @user.full_name, mail.body.encoded
  #   assert_match @user.activation_token, mail.body.encoded
  #   assert_match CGI::escape(@user.email), mail.body.encoded
  # end

end
