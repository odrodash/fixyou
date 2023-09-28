class PreferencesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[scheme_color switch_locale]

  def scheme_color
    session[:scheme_color] = params[:color]
    render json: 'ok'
  end

  def switch_locale
    locale = params[:format].to_sym
    I18n.locale = locale

    redirect_to request.referrer
  end
end
