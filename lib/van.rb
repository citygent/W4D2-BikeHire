class Van

  attr_reader :bikes

  def initialize
    @capacity = 10
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def collect(bike, station)
    raise 'Van is full' if full?
    raise 'bike is not broken' unless bike.broken?
    station.release(bike)
    @bikes << (bike)
  end

#   def collect_all(station)
#     puts "station broken bikes list: #{station.broken_bikes.inspect}"
#     @bikes += station.broken_bikes
#     station.broken_bikes 
#   end 

  def full?
    bike_count == @capacity
  end

end