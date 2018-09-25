Rails.application.routes.draw do

root 'static_pages#home'

get 'signup' => 'users#new', :as => :signup
get 'login' => 'user_sessions#new', :as => :login
post 'login' => 'user_sessions#create'
delete 'logout' => 'user_sessions#destroy', :as => :logout

resources :user_sessions, only: [:new, :create, :destroy]
resources :users
resources :password_resets, only: [:new, :create, :edit, :update]
resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
