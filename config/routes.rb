Rails.application.routes.draw do
  get 'oauths/oauth'

  get 'oauths/callback'


  root "home#index"
  scope "/:locale" do

    resources :cards
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    resources :decks
  end
  get "logout" => 'sessions#destroy', as: 'logout'
  get "login" => 'sessions#new', as: 'login'
  get "signup" => 'users#new', as: 'signup'
  post '/login' => 'sessions#new'
  patch 'home' => 'home#check'
  post 'home', to: 'home#check', defaults: { format: :js }
  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callbck' => 'oauths#callback'
  get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
end
