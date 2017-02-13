Rails.application.routes.draw do

  scope "/:locale" do
      namespace :dashboard do
        resources :decks
        resources :cards
        resources :home, only:[:index, :check]
      end
      namespace :home do
        resources :users
        resources :sessions, only: [:new, :create, :destroy]
      end
  end
  get 'oauths/oauth'

  get 'oauths/callback'


  root "dashboard/home#index"

  get 'logout' => 'home/sessions#destroy', as: 'logout'
  get 'login' => 'home/sessions#new', as: 'login'
  get 'signup' => 'home/users#new', as: 'signup'
  post 'login' => 'home/sessions#new'
  patch 'home' => 'home#check'
  get 'home', to: 'dashboard/home#index', defaults: { format: :json }
  post 'home', to: 'dashboard/home#check', defaults: { format: :json }
  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callbck' => 'oauths#callback'
  get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
end
