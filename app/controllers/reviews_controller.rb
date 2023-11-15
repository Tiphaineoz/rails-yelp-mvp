class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def index
    @reviews= Review.all
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to show_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

end
