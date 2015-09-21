Rails.application.routes.draw do
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  resources :users, only: [:new, :create]
  # resources :categories, only: [:index]
  namespace :admin do
    resources :categories, only: [:index, :new, :create, :destroy] #:show
  end
  namespace :user do
    resources :categories, only: [:index] #:show
  end

  resources :ideas
end
