class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bike_arr, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_arr = []
  end

  def release_bike
    raise RuntimeError, 'No bikes available' if empty? || @bike_arr[-1].broken?
    @bike_arr.pop
  end

  def dock(bike)
    raise RuntimeError, "Dock is full" if full?
    bike.broken? ? @bike_arr.unshift(bike) : @bike_arr << bike
  end

  private

  def full?
    @bike_arr.length >= @capacity
  end 

  def empty?
    @bike_arr.empty?
  end
end

class Bike
  def working?
    !@broken
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end
end
