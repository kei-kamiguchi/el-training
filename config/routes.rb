Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks
end
