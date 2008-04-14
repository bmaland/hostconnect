require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::PingBuilder do
  before(:each) do
    @xml = File.read("./spec/fixtures/requests/ping.xml")
    @req = PingBuilder.new
  end
  
  it "should return pure xml with the to_s method" do
    @req.to_s.should == @xml
  end

  it "should return a XML Builder object" do
    @req.to_xml.should respond_to(:target!)
  end
  
  it "should know how to submit itself" do
    response = File.read("./spec/fixtures/responses/ping.xml")
    Client.should_receive(:post_xml_request).with(@xml).and_return(response)
    ping = @req.submit
    ping.should be_an_instance_of(Ping)
  end
end
