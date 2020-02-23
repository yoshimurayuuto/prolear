class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :return

  def index
    @conversations = Conversation.all
  end
  def create
    # 自身で作ったログイン機能であれば、独自実装してあるはずの
    # logged_in?メソッドを使用して、ログイン時のみ会話を保存できるようにする。
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)  
  end
  
  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def return
    if current_user.name.nil?
      redirect_to enter_users_path, notice: "基本情報を入力してください"
    end
  end
end
