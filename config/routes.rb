Rails.application.routes.draw do
  resources :tickets
  resources :timetables
  resources :movies
  resources :chairs
  resources :theaters
  resources :orderlines
  resources :orders
  resources :beverages
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'main' ,to:"system#main"
  get 'register' ,to:"system#register"
  post 'register',to:"system#createuser"
  post 'main' ,to:"system#checklogin"
  get 'movieindex' ,to:"system#movieindex"

end
