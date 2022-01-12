Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #here defining a route other than the default one..
  root 'welcome#index'
  #We will create "resources", this will create all the routes for different
  #actions that will be adding to our application
  resources :docs

end
