require 'DockingStation'
require 'Bike'
describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it 'gets a bike and expects to be working' do
    expect(DockingStation.new.release_bike.working?).to eq true
  end
end
