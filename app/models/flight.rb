class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers
  
  def passenger_names
    passengers.pluck(:name)
  end
  
end