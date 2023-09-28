Rails.application.routes.draw do
  root 'pages#home'
  
  post 'preferences/scheme_color'
  post 'preferences/switch_locale'
end
