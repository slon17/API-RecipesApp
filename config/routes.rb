Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, param: :email
  #resource :recipes
  post '/auth/login', to: 'authentication#login'
  get '/recipes', to: 'recipes#index'
  post '/new-recipe', to: 'recipes#create'
  get '/*a', to: 'application#not_found'

end
