Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :tags
  root to: 'hello#index'

  namespace :api do
    namespace :tags do
      resources :autocompletions
    end
  end
end