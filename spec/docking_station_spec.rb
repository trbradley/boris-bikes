require 'DockingStation'

describe DockingStation do

    describe '#initialize' do
      subject { DockingStation.new }
      let(:bike) { Bike.new }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock(bike)
        end
        expect { subject.dock(bike) }.to raise_error
      end

      it 'has a capacity that can be set' do
        docking_station = DockingStation.new(50)
        expect(docking_station.capacity).to eq 50
      end

      it 'has a default capacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end

    describe '#release_bike' do
      it { is_expected.to respond_to :release_bike }

      it 'gets a bike and expects to be working' do
        bike = Bike.new
        subject.dock(bike)
        expect(bike).to be_working
      end
    end

    describe '#empty' do
      it 'raises exception when no bikes' do
        expect {subject.release_bike}.to raise_error
      end
    end

    describe 'dock' do
      it 'allows a bike to be docked' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end

    describe 'full?' do
      it 'raises an error if the dock is full' do
        subject.capacity.times { subject.dock Bike.new }
        expect {subject.dock Bike.new}.to raise_error
      end
    end
end
