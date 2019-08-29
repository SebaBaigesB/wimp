class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
    added_attrs = [:nickname, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
