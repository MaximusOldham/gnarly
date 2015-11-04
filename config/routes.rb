Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :gnarlies, only: [:index]
  resources :welcome, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  # resources :gnarly, only: [:create, :new, :index, :show, :destroy]
  get '/login', to: 'sessions#new'
end
