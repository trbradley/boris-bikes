class Garage
  def initialize
    @bikes = []
  end

  def store(bike)
    bikes << bike
  end

  def release_working_bike
    fail 'No bikes in garage!' if empty?
    fail 'No working bikes in garage!' if broken_only?
    bikes.delete(bikes.find(&:working?))
  end

  private

  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def broken_only?
    !bikes.find(&:working?)
  end
end
