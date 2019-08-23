class Owner::MealsController < ApplicationController
  def index
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
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @current_user = Meal.where(user: current_user)
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :photo, :prix, :tags)
  end
end
