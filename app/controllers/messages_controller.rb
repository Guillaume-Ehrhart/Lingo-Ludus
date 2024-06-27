class MessagesController < ApplicationController

  def create
    # content, chatroom, user
    @message = Message.new(message_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    @message.user = current_user

    @message.save
    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(
        partial: "messages/message",
        locals: { message: @message },
        #  access the message’s user_id, aka sender_id.
        sender_id: @message.user.id
      )
    )
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
