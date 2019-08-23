class Owners::RestaurantsController < ApplicationController
  def index
  end

  def show
    @restaurants = Restaurant.where(user: current_user)
  end

  def new
    @current_user = Restaurant.where(user: current_user)
    @restaurant = Restaurant.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
