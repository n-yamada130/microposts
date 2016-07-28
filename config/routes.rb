Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup'   , to: 'users#new'
  get 'login'    , to: 'sessions#new'
  post 'login'   , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'users/edit', to: 'users#edit'
  patch 'users/',   to: 'users#update'
  get 'users/:id/followings', to: 'users#followings'
  get 'users/:id/followers', to: 'users#followers'
  get 'users/:id/favorites', to: 'users#favorites'

  resources :users, except: [:edit, :update]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end