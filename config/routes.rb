Rails.application.routes.draw do
 
  devise_for :users
  resources :personnages

  
  root'home#index'
  get '/search',to:"personnages#search"

  get 'home/about'
  get 'home/combat'
end


 