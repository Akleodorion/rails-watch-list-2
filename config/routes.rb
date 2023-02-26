Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lists#index"
  resources :lists, only: %i[index create show] do
    resources :bookmarks, only: %i[create destroy]
  end
end
