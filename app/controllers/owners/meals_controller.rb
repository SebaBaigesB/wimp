class Owners::MealsController < ApplicationController
  def destroy
    @current_user = Meal.find(user: current_user)
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to owner_meals_path
  end
end
