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
  get 'movietimetable/:movie_id' ,to:"system#movietimetable" ,as:"movietimetable_sys"
  get 'selectseat/:timetable_id' ,to:"system#selectseat" ,as:"selectseat"
  post 'selectseat/:timetable_id' ,to:"system#maketicket"
  get 'showticketorder/:order_id' ,to:"system#showticketorder" ,as:"showticketorder"
  get 'beverage_ticket/:order_id' ,to: "system#beverage_ticket" ,as:"beverage_ticket"
  post 'beverage_ticket/:order_id' ,to: "system#sendbeverage_ticket"
  get 'summaryorder_ticket/:order_id' ,to:"system#summaryorder_ticket" ,as:"summaryorder_ticket"
  get 'cancleorderline/:orderline_id' ,to:"system#cancleorderline" ,as:"cancleorderline"
  get 'cancleorder/:order_id' ,to:"system#cancleorder" ,as:"cancleorder"

end
