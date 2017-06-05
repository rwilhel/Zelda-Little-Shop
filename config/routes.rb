Rails.application.routes.draw do
  root 'dashboard#index'

  resources :users, only: [:new, :create]
  resources :items, only: [:index, :show, :create, :update]
  resources :categories, only: [:index, :show]

  namespace :admin do

    get '/dashboard', to: 'dashboard#index'

    resources :orders
    resources :items
    resources :users, only: [:show]
  end

  namespace :patron do
    resources :orders, only: [:new, :create, :index, :show]
    resources :users, only: [:show]
  end

  get '/dashboard', to: 'dashboard#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/cart', to: 'cart#show'
  post '/cart', to: 'cart#create'
  delete '/cart', to: 'cart#destroy'
  put '/cart', to: 'cart#update'
end
