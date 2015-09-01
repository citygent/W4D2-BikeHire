require_relative './spec_helper.rb'
require_relative '../lib/van.rb'
require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'
require_relative '../lib/garage.rb'

describe Garage do

  it 'should be empty on build' do
    garage = Garage.new
    expect(garage.bike_count).to eq 0
  end

end
