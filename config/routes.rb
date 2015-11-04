Rails.application.routes.draw do
  root "gnarlies#index"
  resources :users, only: [:new, :create, :show, :edit, :update] do
  resources :gnarlies, only: [:create]
end
  resources :session, only: [:new, :create, :destroy]
  # resources :gnarly, only: [:create, :new, :index, :show, :destroy]
end
