require 'van'

describe Van do

  describe '#load' do
    it { is_expected.to respond_to(:load).with(1).argument }

    it 'loads bike on to van' do
      bike = double(:bike)
      expect(subject.load(bike)).to eq [bike]
    end
  end

end
