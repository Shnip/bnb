require 'test_helper'

class MessagesCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @other_user.activate
  end

  test "should create message" do
    login_user(@user)
    get user_path(@other_user)
    assert_select 'a', text: 'Send message'

    post conversations_path(sender_id: @user.id, recipient_id: @other_user.id)

    assert_redirected_to conversation_messages_path(Conversation.last)
    follow_redirect!
    assert_template "messages/index"
    assert_select "form#new_message"

    assert_difference "Message.count",  1 do
      post conversation_messages_path(Conversation.last), xhr: true,
                                                      params: {
                                                        message: {
                                                          content: "Hello world",
                                                          user_id: @user.id
                                                        }}
    end
  end
end
