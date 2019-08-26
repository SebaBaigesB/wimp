class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:restaurants_index]
      @restaurants = Restaurant.where(food_style: params[:restaurants_index][:restaurants])
    else
      @restaurants = Restaurant.all
    end
    @restaurants_geo = Restaurant.geocoded

    @markers = @restaurants_geo.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant }),
        image_url: helpers.asset_url('resto.jpg')
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @meals = Meal.all
    @meal = Meal.find(params[:id])
  end
end
