require 'rails_helper'

RSpec.describe Flight, type: :model do 
  before :each do 
    @delta = Airline.create(name: "delta")
    @flight1 = Flight.create(number:1337, date:"2015-10-06", departure_city:"houston", arrival_city:"denver", airline:@delta)
    @flight2 = Flight.create!(number:7331, date:"2015-10-07", departure_city:"los angeles", arrival_city:"new york", airline:@delta)
    @passenger1 = Passenger.create(name: "joe", age: 20)
    @passenger2 = Passenger.create(name: "emily", age: 21)
    @passenger3 = Passenger.create(name: "jane", age: 22)
    @passenger4 = Passenger.create(name: "eric", age: 23)
    FlightPassenger.create(flight: @flight1, passenger: @passenger1)
    FlightPassenger.create(flight: @flight1, passenger: @passenger2)
    FlightPassenger.create(flight: @flight2, passenger: @passenger3)
    FlightPassenger.create(flight: @flight2, passenger: @passenger4)
  end

  describe "associations" do 
    it { should belong_to :airline }
    it { should have_many :flight_passengers }
    it { should have_many :passengers}
  end

  describe "instance methods" do 
    it "passenger names" do 
      expect(@flight1.passenger_names).to eq(["joe", "emily"])
      expect(@flight2.passenger_names).to eq(["jane", "eric"])
    end
  end
end