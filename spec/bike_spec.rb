require "bike"

describe Bike do
  it { is_expected.to respond_to :working? }
  it { is_expected.to respond_to :report}




  describe "#working?" do

    it "reports that a bike is not working" do
      subject.report
      expect(subject.working?).to be false
    end

  end

end
