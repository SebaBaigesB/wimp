Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :restaurants, only: [:index, :show] do
    resources :meals, only: [:index, :show] do
      resources :meal_tags
    end
  end
  resources :tags, only: [:index]

  namespace :owners do
    resources :restaurants
    resources :meals
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
