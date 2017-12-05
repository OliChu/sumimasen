Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'

  # RECIPES
  resources :recipes do
    resources :measures, only: [:new, :create, :edit, :update, :destroy]
  end
  get '/recipes/:id/add_details', to: 'recipes#add_details', as: :add_details

  # TOOLS
  resources :tools

  # TAGS
  resources :tags, only: [:new, :create, :edit, :update, :destroy]

  #INGREDIENTS
  resources :ingredients


end
