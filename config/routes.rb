Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" } 

  resources :articles
  root to: "home#index" 
  get 'users' => 'home#all_users', as: :users
  get 'users/:id' => 'home#show', via: :get,as: :show_user
  
end
