class MessagesController < ApplicationController

  before_action :set_chatroom, only: [:create, :destroy]

  def create
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.save
    redirect_to chatroom_path(@chatroom)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to chatroom_path(@chatroom)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
