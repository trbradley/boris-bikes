require "docking_station"

describe DockingStation do
   it { is_expected.to respond_to :release_bike }

   describe '#release_bike' do
     it 'releases a bike' do
       bike = Bike.new
       subject.dock(bike)
       expect(subject.release_bike).to eq bike
     end

     it "gives us an error message when the station is empty" do
       expect{subject.release_bike}.to raise_error("No bike available")
     end
   end

   describe '#dock(bike)' do
     it { is_expected.to respond_to(:dock).with(1).argument }

    #  it "has capacity to store 20 bikes" do
    #    expect{20.times{subject.dock Bike.new}}.not_to raise_error
    #  end

     it 'raises an error when the station is full' do
       subject.dock(Bike.new)
       expect{20.times{subject.dock(Bike.new)}}.to raise_error("This station is full")
     end
   end

   describe '#bike' do
     it 'gets a working bike' do
       bike = Bike.new
       subject.dock(bike)
       expect(bike).to be_working
     end

     it "tells us whats in the docking station when it's empty" do
       station = DockingStation.new
       expect(station.bikes).to eq []
     end

     it "tells us what's in the docking station when it's full" do
       station = DockingStation.new
       bike = Bike.new
       station.dock(bike)
       expect(station.bikes).to eq [bike]
     end
    end

end
