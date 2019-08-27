class Owners::RestaurantsController < ApplicationController

  def new
    @current_user = Restaurant.where(user: current_user)
    @restaurant = Restaurant.new
  end

  def create
    @current_user = Restaurant.where(user: current_user)
    @restaurant = Restaurant.new
  end

  def edit
  end

  def update
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
      redirect_to restaurants_path
  end
end
