Rails.application.routes.draw do
  resources :torre_travels
  get 'all_housings',   to: 'torre_travels#all_housings'
end
