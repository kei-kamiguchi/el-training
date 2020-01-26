Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  resources :users
  namespace :admin do
    resources :users
  end
  resources :sessions, only: [:new, :create, :destroy]
end
