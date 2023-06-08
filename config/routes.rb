Rails.application.routes.draw do
  root "home#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :teachers
  resources :pods
  devise_for :users
  get "home/index"
  resources :children
end
