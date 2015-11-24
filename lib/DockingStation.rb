require_relative '../lib/Bike.rb'

class DockingStation

  attr_accessor :docked

  def release_bike
    if @docked == ''
      raise 'No bikes available!'
    end
    Bike.new
  end

  def dock(bike)
    @docked = bike
  end

end
