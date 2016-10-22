class Users::SessionsController < Devise::SessionsController
before_action :configure_sign_in_params, only: [:create]
after_action :redirect_to_forum

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    store_location_for(resource, params[:redirect_to])
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def redirect_to_forum
    redirect_to '/forum'
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
