Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

scope '(:locale)', locale: /fr|es/ do
  resources :restaurants, only: [:index, :show] do
    resources :meals, only: [:index, :show] do
      resources :meal_tags
    end
  end

  resources :tags, only: [:index]

  namespace :owner do
    resources :restaurants
    resources :meals
  end
  get "/tags/save-with-session", to: "tags#save_with_session"
end
end
