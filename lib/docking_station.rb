# lib/docking_station.rb

require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bike = nil
  end

  def dock(bike)
    raise "This station is full" if @bike
    @bike = bike
  end

  def release_bike
    raise "No bike available" unless @bike
    @bike
  end

end
