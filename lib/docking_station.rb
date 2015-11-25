# lib/docking_station.rb

require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    raise "This station is full" if @bikes.length == 20
    @bikes << bike
  end

  def release_bike
    raise "No bike available" if @bikes == []
    @bikes.pop
  end

end
