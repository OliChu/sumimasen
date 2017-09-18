Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'

  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
