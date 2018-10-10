class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.involving(current_user).order('updated_at DESC')
  end

  def create
    request = Conversation.between(params[:sender_id], params[:recipient_id])
    if request.present?
      @conversation = request.first
    else
      @conversation = Conversation.create(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
