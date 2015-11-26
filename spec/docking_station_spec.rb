require 'DockingStation'

describe DockingStation do

    describe '#initialize' do
      subject { DockingStation.new }
      let(:bike) { double(:bike) }
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
        subject.dock double(:bike)
        bike = subject.release_bike
        expect(bike).to be_working
      end

      it 'does not release a broken bike' do
        bike = double(:bike)
        station = DockingStation.new
        station.report(bike)
        station.dock(bike)
        expect {station.release_bike}.to raise_error('Bike is broken!')
      end
    end

    describe '#empty' do
      it 'raises exception when no bikes' do
        expect {subject.release_bike}.to raise_error
      end
    end

    describe 'dock' do
      it 'allows a bike to be docked' do
        bike = double(:bike)
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end

    describe 'full?' do
      it 'raises an error if the dock is full' do
        subject.capacity.times { subject.dock double(:bike) }
        expect { subject.dock double(:bike) }.to raise_error
      end
    end

    describe '#report' do
      it { is_expected.to respond_to :report }
      it 'reports a specific bike' do
        expect(subject).to respond_to(:report).with(1).argument
      end
      it 'changes the status of the bike to broken' do
        station = DockingStation.new
        bike = double(:bike)
        expect { station.report(bike) }.to change{bike.working?}.to(false)
      end

    end
end
