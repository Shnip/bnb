Rails.application.routes.draw do
root 'user#index'
resources :user_sessions, only: [:new, :create, :destroy]
resources :users
resources :password_resets, only: [:new, :create, :edit, :update]

get 'signup' => 'users#new', :as => :signup
get 'login' => 'user_sessions#new', :as => :login
post 'logout' => 'user_sessions#destroy', :as => :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
