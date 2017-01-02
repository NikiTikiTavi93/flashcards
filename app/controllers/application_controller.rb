class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_locale

  def set_locale
    UserLocale.call(session: session[:locale], params: params[:locale], user: current_user,
                                  http_accept_language: http_accept_language)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private
    def not_authenticated
      redirect_to login_path, notice: t('flash_messages.user.not_auth')
    end

end
