require "docking_station"

describe DockingStation do
   it { is_expected.to respond_to :release_bike }

   describe '#release_bike' do
     it 'releases a bike' do
       bike = Bike.new
       subject.dock(bike)
       expect(subject.release_bike).to eq bike
     end
   end


   it 'gets a working bike when requested to release_bike' do
     bike = Bike.new
     subject.dock(bike)
     expect(bike).to be_working
   end

   it "gives us an error message releasing a bike from an empty station" do
     station = DockingStation.new
     expect{station.release_bike}.to raise_error("No bike available")
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
