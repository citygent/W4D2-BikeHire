class DockingStation

  def initialize
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def dock(bike)
    @bikes.push bike # @bikes << bike
  end

end
