class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_locale

  def set_locale
    #I18n.locale = current_user.try(:locale) || I18n.default_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private
    def not_authenticated
      redirect_to login_path, notice: "Please login first"
    end

end
