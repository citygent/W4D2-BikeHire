class Van

  def initialize
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def collect bike
    @bikes << bike
  end

end
