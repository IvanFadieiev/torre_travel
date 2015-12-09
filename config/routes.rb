Rails.application.routes.draw do
  # get 'users/sign_in'
  # get 'users/administration'
  root 'torre_travels#index'
  resources :users
  resources :images, only: [:edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :comments
  resources :torre_travels do
    resources :images
  end
  get 'all_types',   to: 'torre_travels#all_housings'
  get 'housing',     to: 'torre_travels#housing'
  get 'new',         to: 'torre_travels#new'
  match '/signin',   to: 'sessions#new',         via: 'get'
  match '/signout',  to: 'sessions#destroy',     via: 'delete'
end
