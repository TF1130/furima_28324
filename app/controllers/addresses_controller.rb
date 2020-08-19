class AddressesController < ApplicationController
  def index
    @addresses = Address.order("items DESC")
  end

  def new
  end
end
