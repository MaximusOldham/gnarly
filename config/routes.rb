Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :gnarlies
  resources :welcome, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  # resources :gnarly, only: [:create, :new, :index, :show, :destroy]
  get '/login', to: 'sessions#new'
  get '/gnarlies/:id/like', to: 'gnarlies#like'
end
