Rails.application.routes.draw do
  resources :todolists
  resources :todos
  
  devise_for :users
  
  root "todolists#index"
end
