class Van
  def initialize
    @bikes = []
  end

  def load(bike)
    bikes << bike
  end

  def unload(bike)
  end

  private

  attr_reader :bikes
end
