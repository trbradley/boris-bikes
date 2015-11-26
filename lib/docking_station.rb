require_relative 'bike'

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  def release_bike
    fail 'No bike available' if empty?
    fail 'No working bikes available' if broken_only?
    bikes.delete(bikes.find(&:working?))
  end

  private

  attr_reader :bikes

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

  def broken_only?
    !bikes.find(&:working?)
  end
end
