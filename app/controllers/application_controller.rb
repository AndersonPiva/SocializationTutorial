class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :name, :image, :email, :password,:password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username,:uid, :name, :image, :email,:password,:password_confirmation)}
  end
end
