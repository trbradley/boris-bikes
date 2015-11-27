class Van
  def initialize
    @bikes = []
  end

  def load(bike)
    bikes << bike
  end

  def unload
    bikes.pop
  end

  private

  attr_reader :bikes
end
