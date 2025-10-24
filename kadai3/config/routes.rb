# config/routes.rb
Rails.application.routes.draw do
  root 'welcome#index'  # トップ画面

  resources :users, only: [:new, :create, :show]  # ユーザーのサインアップ・マイページ
  resource :session, only: [:new, :create, :destroy]  # ログイン・ログアウト
end
