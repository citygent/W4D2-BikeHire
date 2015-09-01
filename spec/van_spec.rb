require_relative './spec_helper.rb'
require_relative '../lib/van.rb'
require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe Van do

  let(:station) { DockingStation.new }
  let(:bike) { Bike.new }
  let(:van) { Van.new }

  it 'should be empty when created' do 
    expect(van.bike_count).to eq 0
  end

  it 'should collect broken bike from station' do
    bike.break
    station.dock(bike)

    van.collect(bike, station)
    expect(van.bike_count).to eq 1
  end

  it 'should not collect working bikes' do 
    station.dock(bike)

    expect { van.collect(bike, station) }.to raise_error 'bike is not broken'
      # puts van.bikes.inspect
  end

  it 'should know when its full' do
    9.times { station.dock (Bike.new) }
    bike.break
    station.dock(bike)
    # puts station.bikes.inspect
    10.times { van.collect(bike, station)}
    # puts van.bikes.inspect
    expect(van.full?).to be true
  end

  it 'shouldn\'t let you over-load with bikes' do 
    9.times { station.dock (Bike.new) }
    bike.break  #this breaks all the bikes :S
    station.dock(bike) #actually this method is copying the broken bike, which obviously isn't something that can happen in real life.
    10.times { van.collect(bike, station)}
    expect {van.collect(bike, station).to raise_error 'Van is full'}
    puts van.bikes.count
  end

  it 'should drop off broken bikes at Garage' do 
    bike.break
    station.dock(bike)
    van.collect(bike, station)
    van.drop(bike)
    expect(van.bike_count).to eq 0
  end

end

#   it 'should collect all broken bikes from station' do 
#     10.times { 
#     bike = Bike.new        #broken bikes
#     bike.break
#     station.dock(bike) 
#     }
#     10.times {
#     bike = Bike.new        #fixed bikes
#     station.dock(bike)
#     }
#     puts "station bikes before collect: #{station.bikes.inspect}"

#     van.collect_all(station)

#     puts "station bikes after collect: #{station.bikes.inspect}"
#     expect(van.bike_count).to eq 10
#   end
