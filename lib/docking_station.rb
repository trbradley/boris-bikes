require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'This station is full' if full?
    @bikes << bike
  end

  def release_bike
    fail 'No bike available' if empty?
    fail 'No working bikes available' unless bikes.find(&:working?)
    bikes.delete(bikes.find(&:working?))
  end

  private

  def full?
    @bikes.length >= capacity
  end

  def empty?
    @bikes.empty?
  end
end
