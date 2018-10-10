class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates_presence_of :conversation_id, :content, :user_id

  def message_time
    return created_at.strftime('%v').downcase if created_at.today?
    created_at.strftime('%R %v')
  end
end
