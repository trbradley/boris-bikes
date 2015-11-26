require "docking_station"

describe DockingStation do
   it { is_expected.to respond_to :release_bike }

   it "creates a docking station with a default capacity" do
     expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
   end

   it "allows to set a capacity of 50" do
     station = DockingStation.new(50)
     expect(station.capacity).to eq 50
   end

   describe '#release_bike' do
     it 'releases a bike' do
       bike = Bike.new
       subject.dock(bike)
       expect(subject.release_bike).to eq bike
     end

     it "gives us an error message when the station is empty" do
       expect{subject.release_bike}.to raise_error("No bike available")
     end

     it "give us an error message when trying to release a broken bike" do
      bike = Bike.new
      bike.report
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error("This bike is broken")
     end

     it "keeps a broken bike in the dock" do
      begin
        bike = Bike.new
        subject.dock(bike)
        bike.report
        subject.release_bike
      rescue Exception

        expect(subject.bikes).to eq [bike]
      end
     end

   end

   describe '#dock(bike)' do
     it { is_expected.to respond_to(:dock).with(1).argument }

     it 'raises an error when the station is full' do
       subject.capacity.times{ subject.dock(Bike.new) }
       expect{ subject.dock(Bike.new) }.to raise_error("This station is full")
     end
   end

   describe '#bike' do
     it 'gets a working bike' do
       subject.dock(Bike.new)
       expect(Bike.new).to be_working
     end

     it "tells us whats in the docking station when it's empty" do
       expect(subject.bikes).to eq []
     end

     it "tells us what's in the docking station when it's full" do
       bike = Bike.new
       subject.dock(bike)
       expect(subject.bikes).to eq [bike]
     end
    end

end
