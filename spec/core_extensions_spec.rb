require File.dirname(__FILE__) + "/spec_helper"

describe Symbol do
  it "should camelize" do
    :host_connect.classify.should == "HostConnect"
  end
  
  it "should classify" do
    :host_connect.classify.should == "HostConnect"
  end
end

describe String do
  it "should requestify" do
    "AgentId".requestify.should == "AgentID"
  end
end
