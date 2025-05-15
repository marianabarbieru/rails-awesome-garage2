class ReviewsController < ApplicationController

  before_action :set_car, only: %i[new create]
  def new
    @review = Review.new
  end
  def create

    @review = Review.new(review_params)
    @review.car = @car
    if@review.save
    redirect_to cars_path(@car)
    else
      render :new, status: :unprocessable_entity
  end
end


  private


  def set_car
    @car = Car.find(params[:car_id])
  end
  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
