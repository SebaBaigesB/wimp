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

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @meals = Meal.where(restaurant: @restaurant)

    @markers = [{
      lat: @restaurant.latitude,
      lng: @restaurant.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { restaurant: @restaurant }),
      image_url: helpers.asset_url('resto.jpg')
    }]
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(resto_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(resto_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def resto_params
    params.require(:restaurant).permit(:name, :address, :story, :photo, :food_style)
  end
end
