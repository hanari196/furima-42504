class ItemsController < ApplicationController
  # index, show は誰でも見れる
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    # トップページ表示
  end

  def show
    # 商品詳細表示
  end

  def new
    # 出品ページ（ログイン必須）
  end

  def create
    # 出品処理（ログイン必須）
  end
end