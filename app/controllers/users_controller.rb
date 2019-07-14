class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    current_user
    @user = User.find(params[:id])
    @tasks = @user.tasks.order(id: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    # 1. form作成

    # 3. 実際にユーザーを作成するプログラムをcreateに記載する
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー作成成功！"
      redirect_to login_path
    else
      flash.now[:fail] = "作成失敗"
      render :new
    end
  end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def counts(user)
    @count_task = user.task.count
  end
  
  def user_params
    # 2. Strong parameterの設定
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
