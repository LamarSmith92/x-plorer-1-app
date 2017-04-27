Rails.application.routes.draw do

  devise_for :users

    resources :users
    resources :satellites do
    resources :comments
end
    get '/users/:id/about', to: 'users#about'
    get 'users/index'
    root "satellites#index"
  # get '/satellites', to: 'satellites#index', as: 'satellites'
  # get '/satellites/:id', to: 'satellites#show'

  get '/satellites', to: 'satellites#index', as: 'satellites'
  get '/satellites/:id', to: 'satellites#show'

  #
  # get '/satellites/:id/comments/new', to: 'comments#new'
  # post '/satellites/:id', to: 'comments#create'
  # delete '/satellites/:id', to: 'comments#destroy'
end
