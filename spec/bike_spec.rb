require 'bike'

describe Bike do
  describe '#report' do
    it { is_expected.to respond_to :report }
  end

  describe '#working?' do
    it { is_expected.to respond_to :working? }
    it 'reports that a bike is not working' do
      subject.report
      expect(subject.working?).to be false
    end
  end
end
