Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup'   , to: 'users#new'
  get 'login'    , to: 'sessions#new'
  post 'login'   , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'users/edit', to: 'users#edit'
  patch 'users/',   to: 'users#update'
  resources :users, except: [:edit, :update]
end
