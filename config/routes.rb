Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  scope '(:locale)', locale: /fr|es|de|it|cn|jp|pt|sk|gk|sw|th/ do
    resources :restaurants, only: [:index, :show, :new] do
      resources :reviews, only: [:new, :create]
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
end

