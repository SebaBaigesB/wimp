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
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to restaurant_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @¶eview.destroy
    redirect_to restaurant_path(@review)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
