class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :password_confirm, :first_name, :family_name, :first_name_kana, :family_name_kana, :date_select])
  end
end
