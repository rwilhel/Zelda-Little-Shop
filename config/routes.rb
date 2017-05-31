Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#show'

  resources :users, only: [:new, :create]
  resources :carts
  resources :items, only: [:index, :show]

  namespace :admin do
    resources :categories
    resources :orders
    resources :items
  end

  namespace :member do
    resources :categories, only: [:index, :show]
    resources :orders, only: [:new, :create, :index, :show]
    resources :items, only: [:index, :show]
  end

  get '/dashboard', to: 'dashboard#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
