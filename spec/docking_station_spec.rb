require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe DockingStation do 

  let(:station) { DockingStation.new({capacity: 20}) }
  let(:bike) { Bike.new }

  it 'should be empty on build' do
    expect(station.bike_count).to eq 0
  end

  it 'should be able to dock a bike' do 
    station.dock(bike)
    expect(station.bike_count).to eq 1
  end

  it'should be able to release a bike' do 
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq 0
  end

  it 'should know when it has reached capacity' do 
    20.times { station.dock(Bike.new) }

    expect(station.full?).to be true
  end







end
