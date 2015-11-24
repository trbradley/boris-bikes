require 'DockingStation'

describe DockingStation do
  it ' responds to the method release_bike' do
    expect((DockingStation.new).respond_to?(:release_bike)).to eq true
  end



end
