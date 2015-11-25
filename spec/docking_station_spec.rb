require "docking_station"

describe DockingStation do
  #it 'responds to release_bike' do
  #  expect(subject).to respond_to :release_bike
   it { is_expected.to respond_to :release_bike }

   it 'gets a bike when requested to release_bike' do
     bike = subject.release_bike
     expect(bike).to be_working
   end

   it { is_expected.to respond_to(:dock).with(1).argument }

   it "tells us whats in the docking station when it's empty" do
     station = DockingStation.new
     expect(station.bike).to eq nil
   end

   it "tells us what's in the docking station when it's full" do
     station = DockingStation.new
     bike = Bike.new
     station.dock(bike)
     expect(station.bike).to eq bike
   end

end
