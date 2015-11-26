# lib/docking_station.rb

require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    raise "This station is full" if full?
    @bikes << bike
  end

  def release_bike
    raise "No bike available" if empty?
    raise "This bike is broken" if !bikes.find { |bike| bike.working?}
    bikes.delete(bikes.find { |bike| bike.working?})

  end

private
  def full?
    @bikes.length >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
