class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @restaurants = Restaurant.all
    @restaurants_geo = Restaurant.geocoded

    @markers = @restaurants_geo.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
  end

  def show
  end
end
