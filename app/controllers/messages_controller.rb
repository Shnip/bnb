class MessagesController < ApplicationController
  include ActionController::Live
  before_action :set_conversation

  def index
    if current_user == @conversation.sender || current_user == @conversation.recipient
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
      @messages = @conversation.messages.order("created_at DESC")
    else
      redirect_to conversations_path, flash: {danger: "You have not permission to view this"}
    end
  end

  def create
    response.headers["Content-Type"] = "text/javascript"
    @message = @conversation.messages.new(message_params)
    @messages = @conversation.messages.order('created_at DESC')

    if @message.save
      response.headers["Content-Type"] = "text/javascript"
      $redis.publish('messages.create', @message.to_json)
      respond_to do |format|
        format.js
      end
    end
  end

  def events
    response.headers["Content-Type"] = "text/event-stream"
    start = Time.zone.now
    redis = Redis.new
    redis.subscribe('messages.create') do |on|
      on.message do |event, message|
        message = Message.new(JSON.parse(message))
        avatar = gravatar_url(message.user, size: 50)
        data = {src: avatar, full_name: message.user.full_name, date: message.message_time, content: message.content}.to_json
        response.stream.write "data: #{data}\n\n"
      end
    end

  rescue IOError
    logger.info "Stream closed"
  ensure
    redis.quit
    response.stream.close
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
