module PreferencesHelper
  def selected_locale_flag
    case I18n.locale
    when :en
      '🇺🇸 EN'
    when :es
      '🇪🇸 ES'
    else
      '🇺🇸 EN'
    end
  end
end
