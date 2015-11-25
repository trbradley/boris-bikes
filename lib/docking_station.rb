# lib/docking_station.rb

require_relative 'bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def dock(bike)
    raise "This station is full" if full?
    @bikes << bike
  end

  def release_bike
    raise "No bike available" if empty?
    @bikes.pop
  end

private
  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
