Rails.application.routes.draw do
  root 'sessions#index'
resources :sessions
resources :users
get '/login', to: 'sessions#new'
end
