class ItemsController < ApplicationController
  # 非ログイン時に新規投稿商品にアクセスすると、サインアップ画面に遷移するように設定する
  before_action :move_to_index, except: [:index, :show]
  def index
  end

  def new
  end

  def move_to_index
    redirect_to 'users/sign_up' unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
