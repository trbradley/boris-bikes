require 'van'

describe Van do

  describe '#load' do
    it { is_expected.to respond_to(:load).with(1).argument }
  end

end
