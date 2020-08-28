class AddressesController < ApplicationController
  def index
    @addresses = Address.order('items DESC')
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :title,
      :text,
      :address_id,
      :category_id
    )
  end
end
