require 'Bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :report }

  it 'can be reported as broken' do
    expect { subject.report }.to change{subject.working?}.to(false)
  end

end
