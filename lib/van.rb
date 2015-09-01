class Van

  def initialize
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def collect(bike, station)
    raise 'bike is not broken' if bike.broken?
    station.release(bike)
    @bikes << bike
  end

end