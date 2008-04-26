require File.dirname(__FILE__) + "/spec_helper"

describe HostConnect::Client do
  it "should have a http connection" do
    Client.http_connection.should be_an_instance_of(Net::HTTP)
  end
  
  it "should post xml requests" do
    request = File.read("./spec/fixtures/requests/ping.xml")
    response = File.read("./spec/fixtures/responses/ping.xml")
    config = Client.config
    
    Net::HTTP::Post.should_receive(:new).with(config.path).and_return({})
    mock = mock("response", :null_object => true)
    mock.stub!(:body).and_return(response)
    Client.http_connection.should_receive(:request).and_return(mock)
    
    Client.post_xml_request(request).should == response
  end
end
