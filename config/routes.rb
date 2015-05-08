Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :tags
  root to: 'hello#index'
end