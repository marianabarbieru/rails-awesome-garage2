class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def create
    @car = Car.find(params[:car_id])
    @favorite = Favorite.new
    @favorite.car = @car
    if @favorite.save
     redirect_to car_path(@car)
    else
     render 'cars/show', status: :unprocessable_entity
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path, status: :see_other
  end

end
