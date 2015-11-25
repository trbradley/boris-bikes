require_relative '../lib/Bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity)
    @docked = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available!' if empty?
    docked.pop
  end

  def dock(bike)
    fail 'Dock is already full' if full?
    docked << bike
  end

  private

  attr_accessor :docked

  def full?
    docked.count >= capacity
  end

  def empty?
    docked.empty?
  end
end
