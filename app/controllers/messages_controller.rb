class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create]
  before_action :admin, except: [:create]
  def index
    @messages = Message.all
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Message sent successfully"
      redirect_to contact_path
    else
      # render contact_path
    end
  end
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end
  private
  def message_params
    params.require(:message).permit(:title, :description, :user_id)
  end
  def admin
    redirect_to(root_path) unless current_user.admin?
  end

end
