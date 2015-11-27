class Garage

  def initialize
    @bikes = []
  end

  def store(bike)
    bikes << bike
  end

  private

  attr_reader :bikes
end
