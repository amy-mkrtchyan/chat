class MessagesController < ApplicationController

  skip_before_action :authenticate_user!
  before_action :get_room

  def create
    if RoomPolicy.new(current_user).can_view?(@room)
      message = Message.new(message_params)
      message.user = current_user
      if message.save!
        ActionCable.server.broadcast "messages_#{message.room_id}",
                                     message: message.body,
                                     user: message.user.try(:email) || 'Guest User',
                                     avatar: message.user.avatar,
                                     created_at: message.created_at
        head :ok
      end
    else
      redirect_to root_url, notice: 'Permission denied!'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :room_id)
  end

  def get_room
    @room = Room.find(message_params[:room_id])
  end
end
