Rails.application.routes.draw do
  root "home#index"
  get "home/index"
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :children
  resources :pods
  resources :teachers
  resources :pod_requests
end
