Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index' , as: 'home'
  resources :users, only: [:new, :create]
  
  get '/signup' => 'users#new'  , as: 'signup'
  post '/signup' => 'users#create'

  
end
