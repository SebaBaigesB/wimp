class Owner::MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  def index
    @meals = Meal.all
  end

  def show
  end

  def new
    @current_user = Restaurant.where(user: current_user)
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      redirect_to owner_meals_path
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
    params.require(:meal).permit(:name, :description, :photo, :prix, :tags)
  end
end
