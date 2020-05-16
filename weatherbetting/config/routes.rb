Rails.application.routes.draw do
  root 'welcome#index'
  resources :temperature_bets
  post  '/temperature_bets/submit', to: 'temperature_bets#submit'
  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end