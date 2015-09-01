class Van

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def collect(bike, station)
    raise 'bike is not broken' unless bike.broken?
    station.release(bike)
    @bikes << bike
  end

end