require "boris-bikes"


describe Bike do
  describe "#working?" do
    it "Check if bike is working" do
      expect(subject).to respond_to(:working?)
    end
  end
end


