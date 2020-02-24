Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :users, only: [:new, :create]
  
  get '/signup' => 'users#new' 
  post '/signup' => 'users#create'

  
end
