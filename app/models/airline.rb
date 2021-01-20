class Airline < ApplicationRecord
  has_many :flights

  def all_passengers
    flights.unique_passengers
  end
end