require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::GetLocationsBuilder do
  before(:each) do
    @xml = File.read("./spec/fixtures/requests/get_locations.xml")
  end

  it "should produce xml" do
    req = GetLocationsBuilder.new(:agent_id => "EURTAT", :password => "EURTAT")
    
    req.to_s.should == @xml
  end
end
