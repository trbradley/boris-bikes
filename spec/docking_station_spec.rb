require 'docking_station'

describe DockingStation do
  describe '#initialize' do
    it 'creates a docking station with a default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'allows to set a capacity of 50' do
      station = described_class.new(50)
      expect(station.capacity).to eq 50
    end
  end

  describe '#release_broken_bike' do
    it 'give us an error message when trying to release a working bike' do
      bike = double(:bike, working?: true)
      subject.dock(bike)
      expect { subject.release_broken_bike }.to raise_error('No broken bikes available')
    end

    it 'gives me a bike if there is a broken bike in the docking station' do
      broken_bike = double(:bike, working?: false)
      subject.dock(broken_bike)
      bike = double(:bike, working?: true)
      subject.dock(bike)
      expect(subject.release_broken_bike).to eq broken_bike
    end
  end

  describe '#release_working_bike' do
    it 'give us an error message when trying to release a broken bike' do
      bike = double(:bike, working?: false)
      subject.dock(bike)
      expect { subject.release_working_bike }.to raise_error('No working bikes available')
    end

    it 'gives me a bike if there is a working bike in the docking station' do
      working_bike = double(:bike, working?: true)
      subject.dock(working_bike)
      bike = double(:bike, working?: false)
      subject.dock(bike)
      expect(subject.release_working_bike).to eq working_bike
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'raises an error when the station is full' do
      subject.capacity.times { subject.dock(double(:bike)) }
      expect { subject.dock(double(:bike)) }.to raise_error('Docking station full')
    end
  end
end
