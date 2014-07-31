class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to @car
    else
      render 'edit'
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to cars_path
  end

  def show
    @car = Car.find(params[:id])
  end

  private
  def car_params
    params.require(:car).permit(:name, :color)
  end

end
