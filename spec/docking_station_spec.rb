require 'DockingStation'

describe DockingStation do

    it 'Allows user to set capacity instance variable' do
      docking_station = DockingStation.new
      expect (subject.instance_variable_set(:@capacity, capacity))
    end

    describe '#release_bike' do
          it { is_expected.to respond_to :release_bike }

          it 'gets a bike and expects to be working' do
            bike = Bike.new
            subject.dock(bike)
            expect(bike).to be_working
          end

          it 'raises exception when no bikes' do
            expect {subject.release_bike}.to raise_error
          end
    end

    describe '#dock' do
        it 'allows a bike to be docked' do
          bike = Bike.new
          subject.dock(bike)
          expect(subject.docked).to eq [bike]
        end

        it 'raises an error if the dock is full' do
          DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
          expect {subject.dock Bike.new}.to raise_error

        end
    end

end
