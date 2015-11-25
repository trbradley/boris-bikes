require_relative '../lib/Bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :docked

  def initialize
    @docked = []
  end

  def release_bike
    fail 'No bikes available!' if empty?
    @docked.pop
  end

  def dock(bike)
    fail 'Dock is already full' if full?
    @docked << bike
  end

  private
    def full?
      docked.count >= DEFAULT_CAPACITY

    end

    def empty?
      docked.empty?
    end

end
