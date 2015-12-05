Rails.application.routes.draw do
  resources :torre_travels
  get 'all_types',   to: 'torre_travels#all_housings'
  root 'torre_travels#index'
end
