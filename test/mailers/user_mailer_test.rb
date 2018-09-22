require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = users(:one)
  end

  test "password_reset" do
    @user.generate_reset_password_token!
    mail = UserMailer.reset_password_email(@user)
    assert_equal "Password reset", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match @user.email, mail.body.encoded
  end

end
