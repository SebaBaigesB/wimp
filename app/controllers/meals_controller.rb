class MealsController < ApplicationController
  before_action :set_meal, only: [:show]

  def new
    @restaurant = Restaurant.find_by(user: current_user, id: params[:restaurant_id])
    @tags = Tag.all
    @new_meal = Meal.new
  end

  def create
    @restaurant = Restaurant.find_by(user: current_user, id: params[:restaurant_id])
    @tags = Tag.all
    @new_meal = Meal.new(meal_params)
    @new_meal.restaurant = @restaurant

    if @new_meal.save
      params[:meal][:tag_ids][1..-1].each do |tag_id|
        MealTag.create(meal: @new_meal, tag_id: tag_id)
      end
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find_by(user: current_user, id: params[:restaurant_id])
    @tags = Tag.all
    @meal = Meal.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(user: current_user, id: params[:restaurant_id])
    @tags = Tag.all
    @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      redirect_to restaurant_path(@restaurant), notice: 'Your meal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @current_user = Meal.find(user: current_user)
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to owner_meals_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :description, :photo, :price, :tag_ids, :course)
  end
end
