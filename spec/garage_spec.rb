require 'garage'

describe Garage do
  describe '#store' do
    it { is_expected.to respond_to(:store).with(1).argument }

    it 'stores bikes in the garage' do
      bike = double(:bike)
      expect(subject.store(bike)).to eq [bike]
    end
  end
  describe '#release_working_bike' do
    it { is_expected.to respond_to(:release_working_bike) }

    it 'releases bikes from the garage' do
      bike = double(:bike, working?: true)
      subject.store(bike)
      expect(subject.release_working_bike).to eq bike
    end

    it 'raises an error if there are no bikes in the garage' do
      expect { subject.release_working_bike }.to raise_error 'No bikes in garage!'
    end

    it 'releases only working bikes' do
      bike = double(:bike, working?: false)
      subject.store(bike)
      expect { subject.release_working_bike }.to raise_error 'No working bikes in garage!'
    end
  end

end
