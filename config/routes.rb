Rails.application.routes.draw do
  # get 'users/sign_in'
  # get 'users/administration'
  resources :torre_travels do
    resources :images
  end
  resources :images, only: [:edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  get 'all_types',   to: 'torre_travels#all_housings'
  get 'housing',   to: 'torre_travels#housing'
  root 'torre_travels#index'
  resources :users
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/signup',  to: 'users#new',            via: 'get'
end
