require 'rails_helper'

RSpec.describe Passenger, type: :model do 
  describe "associations" do 
    it { should have_many :flight_passengers }
    it { should have_many :flights}
  end
end