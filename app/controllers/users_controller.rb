class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
  end
  
  def new
    @user =User.new
  end

  def edit
  end

  def move_to_index
    unless user_signed_in?
      refirect_to action: :index
    end
  end
end
