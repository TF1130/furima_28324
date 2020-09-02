class OrdersController < ApplicationController

  #出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移すること
  def index
    @item = Item.find_by(id: params[:item_id])
    @order = Order.new

  end

  def new
    @order = UserOrder.new
  end

  def create
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:name, :price, :token, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :order_id )
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]    # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
