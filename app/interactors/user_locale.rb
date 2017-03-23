class UserLocale
  include Interactor

  def call
    http_accept_language = context.http_accept_language
    user = context.user
    params = context.params
    session = context.session
    I18n.locale = if user
      user.locale
      elsif params
        session = params
      elsif session
        session
      else
        http_accept_language.compatible_language_from(I18n.available_locales)
      end
  end
end
