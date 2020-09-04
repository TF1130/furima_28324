class OrdersController < ApplicationController
  before_action :move_to_item_orders, only: [:index]
  before_action :set_item, only: [:index, :create, :new]
  #出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移すること
  def index
    @item = Item.find_by(id: params[:item_id])
    @order_location = OrderLocation.new
  end

  def new
    @order_location = OrderLocation.new
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @order_location = OrderLocation.new(order_params)
    if @order_location.valid?
      pay_item
      @order_location.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.require(:order_location).permit(:price,:postcode,
      :prefecture_id, :city, :block, :phone_number,
      :building, :order_id).merge(token: params[:token],item_id: params[:item_id], user_id: current_user.id )
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end
  

  def token
    :token
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]    # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
  def user
    @item = Item.find_by(id: params[:item_id])
  end

  def move_to_item_orders
    unless user_signed_in? && current_user
      redirect_to root_path
    end
  end
end
