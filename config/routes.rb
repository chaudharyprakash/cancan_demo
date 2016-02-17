Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" } 

  resources :articles
  resources :albumes do
    member do
      get 'like', to: "albumes#like"
      get 'unlike', to: "albumes#unlike"
    end
  end
  match '/albumes/:id/add' => 'albumes#add_picture', via: [:get, :post], as: :album_picture 
  root to: "home#index" 
  get 'users' => 'home#all_users', as: :users
  get 'users/:id' => 'home#show', via: :get,as: :show_user
  get '/pictures' => 'albumes#pictures', as: :users_pictures   
  get '/my_favourite' => 'albumes#favourite', as: :favourites
end
