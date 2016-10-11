Rails.application.routes.draw do
  root "home#index"
  resources :cards
  resources :users
  resources :sessions
  get "logout" => 'sessions#destroy', as: 'logout'
  get "login" => 'sessions#new', as: 'login'
  get "signup" => 'users#new', as: 'signup'
  post '/login' => 'sessions#new'
  post 'home/check' => 'home#check'
end
