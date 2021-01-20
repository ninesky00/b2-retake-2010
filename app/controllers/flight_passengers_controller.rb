class FlightPassengersController < ApplicationController
  def destroy
    FlightPassenger.destroy(params[:id])
    redirect_to flights_path
  end
end