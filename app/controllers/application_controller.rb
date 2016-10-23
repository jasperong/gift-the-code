class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    '/forum'
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_up_path_for(resource)
    '/forum'
  end

  def after_update_path_for(resource)
    signed_in_root_path(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    '/forum' # Or :prefix_to_your_route
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location, :phone_number, :avatar, :avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :location, :phone_number, :avatar, :avatar_cache])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location, :phone_number, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :location, :phone_number, :avatar])
  end
end
