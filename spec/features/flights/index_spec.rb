require 'rails_helper'

RSpec.describe "flights index page" do 
  before (:each) do 
    @delta = Airline.create!(name: "delta")
    @flight1 = Flight.create!(number:1337, date:"2015-10-06", departure_city:"houston", arrival_city:"denver", airline:@delta)
    @flight2 = Flight.create!(number:7331, date:"2015-10-07", departure_city:"los angeles", arrival_city:"new york", airline:@delta)
    @passenger1 = Passenger.create!(name: "joe", age: 20)
    @passenger2 = Passenger.create!(name: "emily", age: 21)
    @passenger3 = Passenger.create!(name: "jane", age: 22)
    @passenger4 = Passenger.create!(name: "eric", age: 23)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger4)
    visit flights_path
  end

  it "display a list of all flight numbers" do 
    within("#flight-information") do 
      expect(page).to have_content(1337)
      expect(page).to have_content(7331)
    end
  end

  it "under each flight number, it display the names of all that flight's passengers" do 
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)

      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
  end

  it "displays a link next to each passenger name that removes the passenger from flight" do 
    within("#passenger-#{@passenger1.id}") do 
      expect(page).to have_link("remove passenger")
      click_on "remove passenger"
    end
    expect(current_path).to eq(flights_path)
    expect(page).to_not have_content(@passenger1.name)
  end
end