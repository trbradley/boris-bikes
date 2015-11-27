class Van
  def initialize
    @bikes = []
  end

  def load(bike)
    bikes << bike
  end

  private

  attr_reader :bikes
end
