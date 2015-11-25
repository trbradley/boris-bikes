require_relative '../lib/Bike.rb'

class DockingStation

  attr_accessor :docked

  def initialize
    @docked = []
  end

  def release_bike
    fail 'No bikes available!' if @docked.empty?
    @docked.pop
  end

  def dock(bike)
    fail 'Dock is already full' if @docked.count >= 20
    @docked << bike
  end

end
