class ShipsController < ApplicationController

  def index
    @ships = Ship.all
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def update
    @ship = Ship.find(params[:id])

    if @ship.update(ship_params)
      redirect_to @ship
    else
      render 'edit'
    end
  end

  def destroy
    @ship = Ship.find(params[:id])
    @ship.destroy

    redirect_to ships_path
  end

  def show
    @ship = Ship.find(params[:id])
  end

  private
  def ship_params
    params.require(:ship).permit(:name, :color)
  end

end
