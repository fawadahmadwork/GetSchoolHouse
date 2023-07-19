Rails.application.routes.draw do
  root 'home#index'
  get '/about', to: 'home#about', as: 'about'
  get '/services', to: 'home#services', as: 'services'
  get '/term_of_services', to: 'home#term_of_services', as: 'term_of_services'
  get '/privacy_policy', to: 'home#privacy_policy', as: 'privacy_policy'
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
