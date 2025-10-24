# app/controllers/users_controller.rb
class UsersController < ApplicationController
  # サインアップ画面
  def new
    @user = User.new
  end

  # ユーザー作成（サインアップ）
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # ユーザーをログイン状態にする
      redirect_to user_path(@user)  # マイページにリダイレクト
    else
      render :new  # サインアップ失敗時に再度フォームを表示
    end
  end

  # マイページ画面（ログインしていないとアクセスできないように）
  def show
    @user = current_user
    redirect_to root_path unless logged_in?  # ログインしていない場合はトップにリダイレクト
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
