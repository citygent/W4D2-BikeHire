class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def bike_fix
    @bikes.each {|bike| bike.fix}
  end

end
