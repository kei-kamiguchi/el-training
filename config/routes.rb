Rails.application.routes.draw do
  root 'tasks#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks
end
