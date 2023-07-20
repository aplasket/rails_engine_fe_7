Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :merchants, only: [:index, :show] do
    # resources :items, only: [:index]
  end

  # get "/items/:item_id", to: "items#show"
end
