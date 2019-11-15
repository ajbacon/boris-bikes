class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bike_arr

  def initialize
    @bike_arr =[]
  end

  def release_bike
    raise RuntimeError, 'No bikes available' if empty?
    @bike_arr.pop
  end

  def dock(bike)
    raise RuntimeError, "Dock is full" if full?
    @bike_arr << bike
  end

  private

  def full?
    @bike_arr.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bike_arr.empty?
  end
end

class Bike
  def working?
    true
  end
end
