Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/recipes', to: 'recipes#index'
  get '/recipes/new', to: 'recipes#new'
  post '/recipes', to: 'recipes#create'
  get '/recipes/:id', to: 'recipes#show'
  get '/recipes/:id/edit', to: 'recipes#edit'
  patch '/recipes/:id', to: 'recipes#update'
  delete '/recipes/:id', to: 'recipes#destroy'

  get '/', to: 'users#index'
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

end
