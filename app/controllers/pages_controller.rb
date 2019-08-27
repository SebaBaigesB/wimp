class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user
      @restaurant = Restaurant.find_by(user: current_user, id: params[:restaurant_id])
    end
  end
end
