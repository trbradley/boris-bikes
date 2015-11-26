require 'docking_station'

describe DockingStation do
  describe '#initialize' do
    it 'creates a docking station with a default capacity' do
      expect(subject.capacity).to eq subject.class::DEFAULT_CAPACITY
    end

    it 'allows to set a capacity of 50' do
      station = subject.class.new(50)
      expect(station.capacity).to eq 50
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'releases a bike' do
      bike = double(:bike, working?: true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'gives us an error message when the station is empty' do
      expect { subject.release_bike }.to raise_error('No bike available')
    end

    it 'give us an error message when trying to release a broken bike' do
      bike = double(:bike, working?: false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error('No working bikes available')
    end

    it 'keeps a broken bike in the dock' do
      begin
        bike = double(:bike, working?: false)
        subject.dock(bike)
        subject.release_bike
      rescue StandardError
        expect(subject.bikes).to eq [bike]
      end
    end

    it 'gives me a bike if there is a working bike in the docking station' do
      4.times do
        bike = double(:bike, working?: false)
        subject.dock(bike)
      end
      goodbike = double(:bike, working?: true)
      subject.dock(goodbike)
      5.times do
        bike = double(:bike, working?: false)
        subject.dock(bike)
      end
      expect(subject.release_bike).to eq goodbike
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'raises an error when the station is full' do
      subject.capacity.times { subject.dock(double(:bike)) }
      expect { subject.dock(double(:bike)) }.to raise_error('This station is full')
    end
  end

  describe '#bikes' do
    it { is_expected.to respond_to(:bikes) }
    it 'should return an array with the bikes in the docking station' do
      array = []
      2.times { bike = double(:bike); array << bike; subject.dock(bike) }
      expect(subject.bikes).to match_array(array)
    end
  end
end
