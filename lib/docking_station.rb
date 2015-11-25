# lib/docking_station.rb

require_relative 'bike'

class DockingStation
  attr_reader :bikes

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
    @bikes.length == 20
  end

  def empty?
    @bikes == []
  end

end
