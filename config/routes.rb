Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  scope '(:locale)', locale: /fr|es|de|it|zh-CN|ja|pt|ko|el|ru|th/ do

    resources :restaurants, only: [:index, :show, :new, :create, :edit, :update] do
      resources :reviews, only: [:new, :create]
      resources :meals, only: [:index, :show, :new, :create, :edit, :update, :destroy ] do

        resources :meal_tags
      end
    end
    resources :reviews, only: [ :show, :edit, :update, :destroy ]
    resources :tags, only: [:index]
    namespace :owners do
      resources :restaurants
    end

    get "/tags/save-with-session", to: "tags#save_with_session"
  end
end

