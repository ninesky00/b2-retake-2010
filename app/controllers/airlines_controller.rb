class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @airline_passengers = @airline.all_passengers
  end
end