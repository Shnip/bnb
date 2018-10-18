Rails.application.routes.draw do

root 'static_pages#home'

get 'signup' => 'users#new', :as => :signup
get 'login' => 'user_sessions#new', :as => :login
post 'login' => 'user_sessions#create'
delete 'logout' => 'user_sessions#destroy', :as => :logout

get 'preload' => 'reservations#preload'
get 'check_conflict' => 'reservations#check_conflict'
get 'your_trips' => 'reservations#your_trips'
get 'your_reservations' => 'reservations#your_reservations'
get 'search' => 'static_pages#search'
get "oauth/callback" => "oauths#callback"
get "oauth/vkontakte" => "oauths#vkontakte"
get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
post "oauth/callback" => "oauths#callback"

resources :user_sessions, only: [:new, :create, :destroy]
resources :users
resources :password_resets, only: [:new, :create, :edit, :update]
resources :account_activations, only: [:edit]
resources :photos

resources :rooms do
  resources :reservations, only: [:create]
  resources :reviews, only: [:create, :destroy]
end

resources :conversations, only: [:create, :index] do
  resources :messages, only: [:create, :index] do
    collection { get :events }
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
