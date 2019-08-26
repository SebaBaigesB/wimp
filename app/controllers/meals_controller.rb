class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  def index
    @meals = Meal.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.where(user: current_user).first
    @tags = Tag.all
    @new_meal = Meal.new
  end

  def create
    @restaurant = Restaurant.where(user: current_user).first
    @tags = Tag.all
    @new_meal = Meal.new(meal_params)
    @new_meal.restaurant = @restaurant
    if @new_meal.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to @owner_meal, notice: 'Your meal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @current_user = Meal.where(user: current_user)
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to owner_meals_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :description, :photo, :prix, :tags, :course, :photo)
  end
end
