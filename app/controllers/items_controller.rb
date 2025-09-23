class ItemsController < ApplicationController
  # index, show は誰でも見れる
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  # トップページ表示
  def index
    @items = Item.with_attached_image.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
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
      :title,
      :product_contents,
      :category_id,
      :condition_id,
      :shipping_method_id,
      :prefecture_id,
      :delivery_time_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end
end
