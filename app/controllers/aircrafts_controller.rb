class AircraftsController < ApplicationController

  def index
    @aircrafts = Aircraft.all
  end

  def edit
    @aircraft = Aircraft.find(params[:id])
  end

  def update
    @aircraft = Aircraft.find(params[:id])

    if @aircraft.update(aircraft_params)
      redirect_to @aircraft
    else
      render 'edit'
    end
  end

  def destroy
    @aircraft = Aircraft.find(params[:id])
    @aircraft.destroy

    redirect_to aircrafts_path
  end

  def show
    @aircraft = Aircraft.find(params[:id])
  end

  private
  def aircraft_params
    params.require(:aircraft).permit(:name, :color)
  end

end