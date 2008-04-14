require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::AgentInfo do
  before(:each) do
    @response = File.read("./spec/fixtures/responses/agent_info.xml")
  end
  
  it "should return an object with attributes set from the response" do
    agent = AgentInfo.new(@response)
    agent.currency.should == "GBP"
    agent.email.should be_nil
    agent.name.should == "European Tours & Travel"
    agent.price_codes.should == "2ST"
    agent.is_sub_login?.should be_false
    agent.has_booking_rights?.should be_false
    agent.has_booking_rights.should be_false
  end
  
  it "should raise error on incorrect login/pass" do
    error = File.read("./spec/fixtures/responses/agent_info_error.xml")
    lambda { AgentInfo.new(error) }.should raise_error(ArgumentError, "1051 SCN EURTAT")
  end
end
