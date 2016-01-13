require 'van'

describe Van do

  describe '#load' do
    it { is_expected.to respond_to(:load).with(1).argument }

    it 'loads bike on to van' do
      bike = double(:bike)
      expect(subject.load(bike)).to eq [bike]
    end
  end

  describe '#unload' do
    it { is_expected.to respond_to(:unload) }

    it 'unloads bike from van' do
      bike = double(:bike)
      subject.load(bike)
      expect(subject.unload).to eq bike
    end

    it 'raises an error if van is empty' do
      expect { subject.unload }.to raise_error 'Van is empty!'
    end
  end

end
