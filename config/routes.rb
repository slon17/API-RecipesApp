Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, param: :email
  #resource :recipes
  post '/auth/login', to: 'authentication#login' #http://localhost:3000/auth/login?email=paulozuniga17@gmail.com&password=123456
  get '/recipes', to: 'recipes#index' #recipes devuelve JSON
  post '/new-recipe', to: 'recipes#create' #/new-recipe?name='nombre'&tipo='tipo'&ingredients='ingredientes,separados,por,coma'&steps='pasos a seguir'&images='imagenes.jpg,separadasPorComa.jpg'
  get '/recipe-by-name/', to: 'recipes#show' #/recipe-by-name/?name='aqui_va_el_nombre' (entre comillas simples, si nombre tiene espacios se debe reemplazar por _) Header: Authorization : token
  get '/recipe-by-type/', to: 'recipes#showType' #/recipe-by-type/?tipo='aqui_va_el_tipo' (entre comillas simples, si tipo tiene espacios se debe reemplazar por _) Header: Authorization : token
  get '/recipe-by-ingredients/', to: 'recipes#showIngredients' #/recipe-by-ingredients/?ingredients='aqui,van,los,ingredientes' (entre comillas simples separados por comas) Header: Authorization : token
  get '/*a', to: 'application#not_found'

end
