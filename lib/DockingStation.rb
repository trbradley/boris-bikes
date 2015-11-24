require_relative '../lib/Bike.rb'

class DockingStation

  attr_accessor :docked

  def release_bike
    fail 'No bikes available!' unless @docked
    @docked
  end

  def dock(bike)
    @docked = bike
  end

end
