# app/models/user.rb
class User < ApplicationRecord
  # Devise モジュール
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # ユーザー名(name)を許可する
  validates :name, presence: true
end
