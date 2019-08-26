class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if current_user
      if current_user.role == "owner"
        @restaurant = Restaurant.where(user_id: current_user.id)
        redirect_to owners_restaurant_path(@restaurant.first.id)
      else current_user.role == "user"
        redirect_to restaurants_path
      end
    end
  end
end
