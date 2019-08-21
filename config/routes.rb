Rails.application.routes.draw do

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
  get "/tags/save-with-session", to: "tags#save_with_session"
end
