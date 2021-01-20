class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers
  
  def passenger_names
    passengers.pluck(:name)
  end
  
  def self.unique_passengers
    joins(:flight_passengers, :passengers)
    .distinct
    .select("passengers.*, order by passengers.name")
    .pluck("passengers.name")
  end
end