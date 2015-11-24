require 'DockingStation'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it 'gets a bike and expects to be working' do
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'allows a bike to be docked' do
      bike = subject.release_bike
      subject.dock(bike)
      expect(subject.docked).to eq bike
    end

    it 'raises exception when no bikes' do
      subject.docked = ''
      expect {subject.release_bike}.to raise_error
    end

end
