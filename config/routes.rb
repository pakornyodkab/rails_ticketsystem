Rails.application.routes.draw do
  resources :chairs
  resources :theaters
  resources :movies
  resources :orderlines
  resources :orders
  resources :beverages
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
