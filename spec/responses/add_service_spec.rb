require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::AddService do
  it "should contain service data" do
    @response = File.read("./spec/fixtures/responses/add_service.xml")
    add_service = AddService.new(@response)
    add_service.booking_id.should == 6050
    add_service.ref.should == "ASIN100101"
    add_service.service_line_id.should == 55418
    add_service.sequence_number.should == 10
    add_service.status.should == "RQ"
  end
end
