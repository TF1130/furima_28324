class ItemsController < ApplicationController
  # 非ログイン時に新規投稿商品にアクセスすると、サインアップ画面に遷移するように設定する
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    redirect_to item_path if item.update(item_params)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :text, :title,
                                 :address_id, :user_id, :category_id, :item_status_id, :delivery_fee_id,
                                 :prefecture_id, :shipdate_standard_id, :price).merge(user_id: current_user.id)
  end
end
