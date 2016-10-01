Rails.application.routes.draw do
  root "home#index"
  resources :cards

  post 'home/check' => 'home#check'
end
