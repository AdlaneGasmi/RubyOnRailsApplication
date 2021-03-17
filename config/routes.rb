Rails.application.routes.draw do
 
  devise_for :users
  resources :personnages


  root'home#index'

  get 'home/about'
end
