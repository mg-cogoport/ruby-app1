Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "movie#post"
  get "/about", to: 'pages#about'
  
  post '/contact', to: 'pages#contact'
  get "/movie/(:id)", to: "movie#index" 
  post "/movie", to: "movie#postMovie" 
  put "/movie/:id", to: "movie#updateMovie" 
  delete "/movie/:id", to: "movie#deleteMovie" 
  get "/movies/(:imdbID)", to: "movie#getMovieImdb"
  get "/smovies", to: "movie#getMovieSearch"
  put "/movies/(:imdbID)", to: "movie#getSetLikeUnlike"
  get "/lmovies", to: "movie#getLikedMovie"
end
