require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::AgentInfoBuilder do
  before(:each) do
    @xml = File.read("./spec/fixtures/requests/agent_info.xml")
  end

  it "should produce xml" do
    req = AgentInfoBuilder.new(:agent_id => "EURTAT", :password => "EURTAT")
    
    req.to_s.should == @xml
  end
end
