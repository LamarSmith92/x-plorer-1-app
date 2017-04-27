Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'satellites#index'
  get '/satellites', to: 'satellites#index', as: 'satellites'
  get '/satellites/:id', to: 'satellites#show', as: 'satellite'
  #
  # get '/satellites/:id/comments/new', to: 'comments#new'
  # post '/satellites/:id', to: 'comments#create'
  # delete '/satellites/:id', to: 'comments#destroy'
end
