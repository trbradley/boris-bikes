require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  def release_working_bike
    release_bike true
  end

  def release_broken_bike
    release_bike false
  end

  private

  attr_reader :bikes

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

  def broken_only?
    !bikes.find(&:working?)
  end

  def working_only?
    !bikes.find { |bike| !bike.working? }
  end

  def release_bike(status)
    fail 'No bike available' if empty?
    fail 'No working bikes available' if broken_only? && status
    fail 'No broken bikes available' if working_only? && !status
    status ? bikes.delete(bikes.find(&:working?)) : bikes.delete(bikes.find { |bike| !bike.working? })
  end
end
