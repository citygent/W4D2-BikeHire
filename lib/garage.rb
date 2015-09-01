class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

end
