require_relative './spec_helper.rb'
require_relative '../lib/van.rb'
require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe Van do

  it 'should be empty when created' do 
    van = Van.new
    expect(van.bike_count).to eq 0
  end

  it 'should be able to collect a bike from a docking station' do 
    van = Van.new
    bike = Bike.new
    station = DockingStation.new
    4.times {station.dock(Bike.new)}
    station.dock(bike)
    # 5.times {station.dock(Bike.new)} #confused, lookup thing?

    puts station.bike_count
    van.collect(bike, station)
    puts station.bike_count
    
    expect(van.bike_count).to eq 1
    expect(station.bike_count).to eq 4
  end

  it 'should only collect broken bikes?' do 
    van = Van.new
    station = DockingStation.new
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    van.collect(working_bike, station)
    expect { van.collect(broken_bike) }.to raise_error 
'bike is not broken'
    expect(van.bike_count).to eq 1
    expect(station.bike_count).to eq 1
  end


end
