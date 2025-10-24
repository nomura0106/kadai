# config/routes.rb
Rails.application.routes.draw do
  root 'home#index'  # トップ画面

  devise_for :users

  # マイページ（ログインしたユーザーのみアクセス）
  get 'users/show', to: 'users#show', as: 'user_root'
end
