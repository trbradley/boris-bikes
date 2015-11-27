require 'garage'

describe Garage do
  describe '#store' do
    it { is_expected.to respond_to(:store).with(1).argument }

    it 'stores bikes in the garage' do
      bike = double(:bike)
      expect(subject.store(bike)).to eq [bike]
    end
  end
end
