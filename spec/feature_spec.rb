require 'DockingStation'

describe DockingStation do

  it 'works - the whole thing' do

    station = DockingStation.new
    bike = Bike.new
    subject.dock(bike)
    expect {subject.dock(bike)}.to raise_error

  end


end
