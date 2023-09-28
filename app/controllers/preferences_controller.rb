class PreferencesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[scheme_color set_locale]

  def scheme_color
    session[:scheme_color] = params[:color]
    render json: 'ok'
  end

  def set_locale
    locale = params[:locale].to_sym
    session[:locale] = locale
    I18n.locale = locale

    redirect_to request.referrer
  end
end
