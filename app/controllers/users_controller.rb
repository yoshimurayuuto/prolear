class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @feeds = Feed.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
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


  private
  def user_params
    params.require(:user).permit(:introduce, :sex, :birth_date, :image, :name)
  end
end
