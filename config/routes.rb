Rails.application.routes.draw do
 
  devise_for :users
  resources :personnages

  
  root'home#index'
  get '/combat',to:"personnages#combat"
  get 'home/combat'

end


 