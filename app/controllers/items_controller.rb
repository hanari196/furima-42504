class ItemsController < ApplicationController
  # index, show は誰でも見れる
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # トップページ表示
  end

  def show
    # 商品詳細表示
  end

  # 出品ページ（ログイン必須）
  def new
    @item = Item.new
  end

  # 出品処理（ログイン必須）
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def item_params
    params.require(:item).permit(
      :title, :product_contents, :category_id, :condition_id,
      :shipping_method_id, :prefecture_id, :delivery_time_id,
      :price, :image
    ).merge(user_id: current_user.id)
  end

end