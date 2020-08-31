class ItemsController < ApplicationController
  # 非ログイン時に新規投稿商品にアクセスすると、サインアップ画面に遷移するように設定する
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(1)
  end

  def show
    @item = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def move_to_index
    redirect_to 'users/sign_up' unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :text, :title,
                                 :address_id, :user_id, :category_id, :item_status_id, :delivery_fee_id,
                                 :prefecture_id, :shipdate_standard_id, :price).merge(user_id: current_user.id)
  end
end
