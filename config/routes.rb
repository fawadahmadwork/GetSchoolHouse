Rails.application.routes.draw do
  resources :teachers
  resources :pods
  devise_for :admins
  devise_for :users
  root "home#index"
  get "home/index"
  resources :children
end
