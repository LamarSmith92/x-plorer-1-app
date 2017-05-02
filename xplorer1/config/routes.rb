Rails.application.routes.draw do



  devise_for :users
    resources :users
    resources :satellites do
    resources :comments
end
    get '/users/:id/about', to: 'users#about'
    get 'users/index'
    root "satellites#index"

   get '/satellites/:id', to: 'satellites#show'

  #not as much to crud
  #possibility of more crud if there were more satellites
  #groups for socialization around satellites / chat feature
  get '/satellites/:id/comments/new', to: 'comments#new'
   post '/satellites/:id', to: 'comments#create'
  delete '/satellites/:id', to: 'comments#destroy'
end
