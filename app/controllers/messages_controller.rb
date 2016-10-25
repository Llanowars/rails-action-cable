class MessagesController < ApplicationController

  def create
    raise
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom_id = @chatroom.id
    @message.user_id = current_user.id
    @message.save
    redirect_to chatroom_path(@chatroom)
  end

  def destroy
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.find(params[:id])
    raise
    @message.destroy
    redirect_to chatroom_path(@chatroom)
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
