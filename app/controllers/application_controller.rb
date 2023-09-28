class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = session[:locale] || I18n.default_locale
    if action
      I18n.with_locale(locale, &action)
    else
      I18n.with_locale(locale) {}
    end
  end
end
