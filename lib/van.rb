class Van
  def initialize
    @bikes = []
  end

  def load(bike)
    bikes << bike
  end

  def unload
    fail 'Van is empty!' if empty?
    bikes.pop
  end

  private

  attr_reader :bikes

  def empty?
    bikes.empty?
  end
end
