# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  # ログイン画面
  def new
  end

  # ログイン処理
  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id  # ログイン状態にする
      redirect_to user_path(@user), notice: "ログイン成功!"
    else
      flash.now[:alert] = "ログイン失敗: メールアドレスまたはパスワードが間違っています"
      render :new
    end
  end

  # ログアウト処理
  def destroy
    session[:user_id] = nil  # ログアウト状態にする
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
