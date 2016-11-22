class MessagesChannel < ApplicationCable::Channel

  delegate :guest?, to: :connection

  # dont allow the clients to call this method
  protected :guest?

  def subscribed
    RoomUser.where( user_id: uid, room_id: params[:room_id] ).first_or_create! unless guest?
    stream_from "messages_#{params[:room_id]}"
  end

  def unsubscribed
    RoomUser.find_by_user_id(params[:user_id]).try(:destroy) unless guest?
    RoomUser.find(uid).destroy! unless guest?
  end

end
