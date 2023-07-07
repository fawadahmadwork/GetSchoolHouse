Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :children
  resources :teachers
  resources :pod_requests
  resources :pods do
    resources :reviews
  end
  namespace :api do
    namespace :v1 do
      resources :pods, only: [:index]
    end
  end
end
