require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::GetLocations do
  before(:each) do
    response = File.read("./spec/fixtures/responses/get_locations.xml")
    @locations = GetLocations.new(response)
  end
  
  it "should return an object with attributes set from the response" do
    @locations.size.should == 10
    @locations.first.code.should == "AAA"
    @locations.first.name.should == "Andorra"
    @locations.last.code.should == "PAR"
    @locations.last.name.should == "Paris"
  end
  
  it "should act like an array" do
    @locations[0].should == @locations.first
  end
  
  it "should be enumerable" do
    i = 0
    @locations.each do |location|
      location.code.size.should == 3
      i += 1
    end
    i.should == 10
  end
end
