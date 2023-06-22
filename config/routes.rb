Rails.application.routes.draw do
  root "home#index"
  get "home/index"
  devise_for :users 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :children
  resources :teachers
  resources :pod_requests
  resources :pods do
    resources :reviews
  end
end
