Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Movies
  get '/movies', to: 'movies#index'

  # Lists
  resources :lists, only: %i[index new create show] do
    # nested Bookmarks
    resources :bookmarks, only: %i[new create]
  end
  # get 'lists', to: 'lists#index'
  # get 'lists/new', to: 'lists#new'
  # post 'lists', to: 'lists#create'
  # get 'lists/:id', to: 'lists#show'

  # Not nested Bookmarks
  # delete 'bookmarks/:id', to: 'bookmarks#destroy', as: :delete_bookmark
  resources :bookmarks, only: %i[destroy]
end
