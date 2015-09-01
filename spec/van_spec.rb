require_relative './spec_helper.rb'
require_relative '../lib/van.rb'
require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe Van do

  it 'should be empty when created' do 
    van = Van.new
    expect(van.bike_count).to eq 0
  end

  it 'should be able to collect a bike' do 
    van = Van.new
    bike = Bike.new
    van.collect(bike)
    expect(van.bike_count).to eq 1
  end


end
