class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    current_user.update(user.params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def move_to_index
    refirect_to action: :index unless user_signed_in?
  end
end
