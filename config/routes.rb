Rails.application.routes.draw do
  resources :recipes, only: [:index, :create]
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html# resources :users
  post '/signup', to: 'users#create'
  get '/me', to: "users#show"
  post '/login', to: 'sessions#show'
  delete 'logout', to: 'sessions#destroy'
 
end
