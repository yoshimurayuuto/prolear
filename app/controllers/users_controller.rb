class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :return, only: [:show, :edit, :index, :matching]
  
  def index
    @users = User.all
    @feeds = Feed.all
    @relationships = Relationship.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @followers = @user.followers.where.not(id:@user.following.ids)
  end


  def enter
    @user = User.find(current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "ブログを作成しました！"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "ユーザーを編集しました！"
    else
      render :edit
    end
  end

  def matching
    @users = User.all
    @relationships = Relationship.all
    @conversations = Conversation.all
  end

  



  private
  def user_params
    params.require(:user).permit(:introduce, :sex, :birth_date, :image, :name)
  end

  def return
    if current_user.name.nil?
      redirect_to enter_users_path, notice: "基本情報を入力してください"
    end
  end
end
