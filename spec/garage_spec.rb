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

  it 'should be able to accept a bike' do 
    garage = Garage.new
    van = Van.new
    bike = Bike.new
    van.drop(bike, garage)
    expect(garage.bike_count).to eq 1
  end

  it 'should be able to fix a bike' do 
    garage = Garage.new
    van = Van.new
    bike = Bike.new
    bike.break
    van.drop(bike, garage)    
    garage.bike_fix
    expect(bike.broken?).to eq false
  end

  it 'should send a fixed bike back to a docking station' do 
    garage = Garage.new
    van = Van.new
    bike = Bike.new
    station = DockingStation.new
    van.drop(bike, garage) 
    expect(garage.bike_count).to eq 1
    van.collect(bike, garage)
    expect(garage.bike_count).to eq 0
  end


end
