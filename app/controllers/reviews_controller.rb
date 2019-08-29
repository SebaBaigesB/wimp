class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params["restaurant_id"])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params["restaurant_id"])
    @review.user = current_user
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find_by(user: current_user, id: params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(user: current_user, id: params[:restaurant_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to restaurant_path(@restaurant), notice: 'Your review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(user: current_user, id: params[:restaurant_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
