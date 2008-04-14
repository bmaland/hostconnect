require File.dirname(__FILE__) + "/spec_helper"

describe HostConnect::Client do
  it "should raise an error when missing block" do
    lambda { HostConnect::Client.configure }.should raise_error
  end
  
  it "should be configurable" do
    HostConnect::Client.configure do |config|
      config.dtd  = "http://dtd"
      config.host = "10.0.0.1"
      config.path = "/iComNew205/servlet/conn"
      config.port = "8080"
    end
    
    config = HostConnect::Client.config
    config.host.should == "10.0.0.1"
    config.path.should == "/iComNew205/servlet/conn"
    config.port.should == "8080"
    config.dtd.should  == "http://dtd"
  end
end
