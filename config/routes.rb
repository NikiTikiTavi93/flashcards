Rails.application.routes.draw do
  root "home#index"
  resources :cards, only: [:index, :show]
end
