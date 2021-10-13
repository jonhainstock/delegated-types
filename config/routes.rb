Rails.application.routes.draw do
  resources :todolists

  resources :recordings do 
    resources :todos
  end
  
  devise_for :users
  
  root "todolists#index"
end
