require 'DockingStation'

describe DockingStation do

    describe '#initialize' do
      subject { DockingStation.new }
      let(:bike) { double(:bike) }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock(bike)
        end
        expect { subject.dock(bike) }.to raise_error('Dock is already full')
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

      let(:bike) { double :bike }
      it 'releases a working bike' do
        allow(bike).to receive(:working?).and_return(true)
        subject.dock(bike)
        expect(subject.release_bike).to be_working
      end

      it 'does not release a broken bike' do
      #  bike = double(:bike)
        allow(bike).to receive(:working?).and_return(false)
        station = DockingStation.new
      #  station.report(bike)
        station.dock(bike)
        expect {station.release_bike}.to raise_error('Bike is broken!')
      end
    end

    describe '#empty' do
      it 'raises exception when no bikes' do
        expect {subject.release_bike}.to raise_error('No bikes available!')
      end
    end

    describe 'dock' do
      let(:bike) { double :bike }
      it 'allows a bike to be docked' do
        allow(bike).to receive(:working?).and_return(true)
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end

    describe 'full?' do
      it 'raises an error if the dock is full' do
        subject.capacity.times { subject.dock double(:bike) }
        expect { subject.dock double(:bike) }.to raise_error('Dock is already full')
      end
    end

    # describe '#report' do
    #   let(:bike) { double :bike }
    #
    #   # it { is_expected.to respond_to :report }
    #
    #   # it 'reports a specific bike' do
    #   #   expect(subject).to respond_to(:report).with(1).argument
    #   # end
    #
    #   # it 'changes the status of the bike to broken' do
    #   #   allow(bike).to receive(:working?)
    #   #   station = DockingStation.new
    #   #   expect { station.report(bike) }.to change{bike.working?}.to(false)
    #   end
    # end
end
