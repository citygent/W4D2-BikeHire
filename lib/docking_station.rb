class DockingStation

  attr_reader :bikes

  DEFAULT_CAPACITY = 50

  def initialize options = {}
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  
  end

  def bike_count
    @bikes.count
  end

  def dock(bike)
    raise 'Station is full' if full? #guard clause
    @bikes.push bike # @bikes << bike
  end

  def release(bike)
    @bikes.delete bike
  end

  def full?
    bike_count == @capacity
  end

  def available_bikes
    @bikes.reject {|bike| bike.broken?}
  end

  def broken_bikes
    @bikes.select {|bike| bike.broken?}
  end

end
