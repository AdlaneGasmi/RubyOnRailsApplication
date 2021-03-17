Rails.application.routes.draw do
 
  resources :personnages


  root'home#index'

  get 'home/about'
end
