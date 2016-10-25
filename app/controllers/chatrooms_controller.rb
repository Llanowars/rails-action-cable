class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.save
    redirect_to chatrooms_path
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages
    @message = Message.new
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.save
    redirect_to chatrooms_path
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
