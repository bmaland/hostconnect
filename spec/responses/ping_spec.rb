require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::Ping do
  before(:each) do
    @response = File.read("./spec/fixtures/responses/ping.xml")
  end
  
  it "should return a ping object with attributes set from the response" do
    ping = Ping.new(@response)
    ping.version.should == "2.05.048"
    ping.backend.should == "iS"
  end
  
  it "should blow up when accessed like a collection" do
    ping = Ping.new(@response)
    lambda { ping.first }.should raise_error
  end
  
  it "should have a string representation" do
    Ping.new(@response).to_s.should == "iS 2.05.048"
  end
end
