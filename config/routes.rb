Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 post '/search', to: 'application#search'

  get '/recipes', to: 'recipes#index'
  get '/recipes/new', to: 'recipes#new'
  post '/recipes', to: 'recipes#create'
  get '/recipes/:id', to: 'recipes#show'
  get '/recipes/:id/edit', to: 'recipes#edit'
  patch '/recipes/:id', to: 'recipes#update'
  delete '/recipes/:id', to: 'recipes#destroy'

  get '/', to: 'users#index'
  post '/users', to: 'users#create'
  get '/signup', to: 'users#new'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/meals', to: 'meals#index'
  get '/meals/new', to: 'meals#new'
  post '/meals', to: 'meals#create'
  get '/meals/:id', to: 'meals#show'
  get '/meals/:id/edit', to: 'meals#edit'
  patch '/meals/:id', to: 'meals#update'
  delete '/meals/:id', to: 'meals#destroy'

  namespace :api do
    namespace :v1 do
      get '/recipes', to: 'recipes#index'
      post '/recipes', to: 'recipes#create'

      post '/meals', to: 'meals#create'

      post '/meal_recipes', to: 'meal_recipes#create'
      get '/meal_recipes/:id', to: 'meal_recipes#show'
      delete '/meal_recipes/:mealId/:recipeId', to: 'meal_recipes#destroy'
    end
  end


end
