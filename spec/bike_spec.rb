require "boris-bikes"


describe Bike do
  bike = Bike.new

  describe "#working?" do
    it "Check if bike is working" do
      expect(bike).to respond_to(:working?)
    end
  end

  describe "#report_broken" do
    it "can be reported broken" do
      bike.report_broken
      expect(bike).to be_broken
    end

  end
 
end


