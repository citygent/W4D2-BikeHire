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
    puts van.bikes.inspect
  end

  

end
