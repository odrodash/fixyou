# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  post 'preferences/scheme_color'
  get 'preferences/set_locale'
end
