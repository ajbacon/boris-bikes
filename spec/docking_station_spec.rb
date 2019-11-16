require 'boris-bikes'

describe DockingStation do
  describe "#release_bike" do
    it "release bike new bike" do
      expect(subject).to respond_to(:release_bike)
    end

    it "raise an error when there is no bike docked" do
      station = DockingStation.new
      expect{station.release_bike}.to raise_error RuntimeError
    end

    it "should not release a bike if all docked bikes are broken" do
      station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      expect{station.release_bike}.to raise_error RuntimeError
    end

    it "should release a working bike if working and broken bikes available" do
      station = DockingStation.new
      bike1 = Bike.new
      bike2 = Bike.new
      bike1.report_broken
      station.dock(bike1)
      station.dock(bike2)
      bike = station.release_bike
      expect(bike).not_to be_broken
    end


  end

  describe "#dock" do
    it "docks the bike at docking station" do
      bike = DockingStation.new
      expect(bike).to respond_to(:dock).with(1).argument
    end

    it "checks if the bike has been docked" do
      station = DockingStation.new
      bike1 = Bike.new
      expect(station.dock(bike1)).to eq([bike1])
    end

    it "checks attr_reader fuction" do
      station = DockingStation.new
      bike1 = Bike.new
      station.dock(bike1)
      expect(station.bike_arr).to eq([bike1])
    end

    it "raises an error if trying to dock a bike when the docking station is full for default capacity" do
      station = DockingStation.new
      expect{ (station::capacity + 1).times {station.dock(Bike.new)}}.to raise_error RuntimeError
    end

    it "raises an error if trying to dock a bike when the docking station is full for user set capacity of 21" do
      station = DockingStation.new(21)
      expect{ (station::capacity + 1).times {station.dock(Bike.new)}}.to raise_error RuntimeError
    end

    it "raises an error if trying to dock a bike when the docking station is full for user set capacity of 19" do
      station = DockingStation.new(19)
      expect{ (station::capacity + 1).times {station.dock(Bike.new)}}.to raise_error RuntimeError
    end


  end



  describe "initialize" do
    it "should have a capacity of 25 when 25 is passed as an argument" do
      station = DockingStation.new(25)
      expect(station.capacity).to eq(25)
    end

    it "should have a default capacity of 20 when no argument it passed" do 
      station = DockingStation.new
      expect(station.capacity).to eq(20)
    end
  end
end




