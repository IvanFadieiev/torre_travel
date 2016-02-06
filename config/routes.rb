Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  captcha_route
  root 'torre_travels#index'
  resources :slyders, only: [:all]
  resources :sessions, only: [:new, :create, :destroy]
  resources :comments, only: [:create, :index]
  resources :torre_travels, only:[:show]
  get 'service',     to: 'torre_travels#service'
  get 'sights',      to: 'slyders#all'
  get 'all_types',   to: 'torre_travels#all_housings'
  get 'housing',     to: 'torre_travels#housing'
  match '/signin',   to: 'sessions#new',         via: 'get'
  match '/signout',  to: 'sessions#destroy',     via: 'delete'
end
