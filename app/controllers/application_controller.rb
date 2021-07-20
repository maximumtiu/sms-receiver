class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # https://github.com/heartcombo/devise#strong-parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:twilio_auth_token, :twilio_account_sid])
  end
end
