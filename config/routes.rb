Rails.application.routes.draw do
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users, only: [:new, :create]
end
